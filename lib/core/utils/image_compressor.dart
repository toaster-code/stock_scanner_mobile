import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

/// Compresses JPEG images to at most [maxSizeKB] KB at a target [quality].
///
/// The actual encoding runs in an [Isolate] via [compute] so the UI thread
/// is never blocked (anti-pattern reference in spec §14).
class ImageCompressor {
  ImageCompressor._();

  static const int maxSizeKB = 300;
  static const int quality = 80;

  /// Compresses [source] and writes the result alongside the original file
  /// with a `_c` suffix.  Returns the compressed [File].
  static Future<File> compress(File source) async {
    final bytes = await compute(_compressBytes, source.path);
    final outPath =
        source.path.replaceFirst(RegExp(r'\.jpe?g$', caseSensitive: false),
            '_c.jpg');
    return File(outPath)..writeAsBytesSync(bytes);
  }

  static List<int> _compressBytes(String path) {
    final raw = File(path).readAsBytesSync();
    final image = img.decodeImage(raw);
    if (image == null) return raw;

    int q = quality;
    var encoded = img.encodeJpg(image, quality: q);

    // Iteratively reduce quality until under the size limit.
    while (encoded.length > maxSizeKB * 1024 && q > 20) {
      q -= 10;
      encoded = img.encodeJpg(image, quality: q);
    }
    return encoded;
  }
}
