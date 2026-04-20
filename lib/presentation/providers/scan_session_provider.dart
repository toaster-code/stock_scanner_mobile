import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/item.dart';

/// The three operational modes.
enum OperationMode { inbound, outbound, inventory }

/// Visual scan feedback shown via [FeedbackOverlay].
enum ScanFeedback { idle, valid, invalid, duplicate }

/// One item that has been scanned during a session.
class ScannedItem {
  final String barcode;
  final Item item;
  int quantity;

  ScannedItem({
    required this.barcode,
    required this.item,
    this.quantity = 1,
  });

  ScannedItem copyWith({int? quantity}) =>
      ScannedItem(barcode: barcode, item: item, quantity: quantity ?? this.quantity);
}

/// Full state of an active scan session.
class ScanSessionState {
  final OperationMode mode;
  final List<ScannedItem> scannedItems;
  final ScanFeedback lastFeedback;
  final String? pickingListId;
  final bool isActive;
  final String? imagePath;
  final String sessionId;

  const ScanSessionState({
    required this.mode,
    required this.scannedItems,
    required this.lastFeedback,
    required this.isActive,
    required this.sessionId,
    this.pickingListId,
    this.imagePath,
  });

  ScanSessionState copyWith({
    OperationMode? mode,
    List<ScannedItem>? scannedItems,
    ScanFeedback? lastFeedback,
    String? pickingListId,
    bool? isActive,
    String? imagePath,
    String? sessionId,
  }) =>
      ScanSessionState(
        mode: mode ?? this.mode,
        scannedItems: scannedItems ?? this.scannedItems,
        lastFeedback: lastFeedback ?? this.lastFeedback,
        pickingListId: pickingListId ?? this.pickingListId,
        isActive: isActive ?? this.isActive,
        imagePath: imagePath ?? this.imagePath,
        sessionId: sessionId ?? this.sessionId,
      );
}

class ScanSessionNotifier extends StateNotifier<ScanSessionState> {
  ScanSessionNotifier(OperationMode mode, String sessionId)
      : super(ScanSessionState(
          mode: mode,
          scannedItems: const [],
          lastFeedback: ScanFeedback.idle,
          isActive: false,
          sessionId: sessionId,
        ));

  void startSession() => state = state.copyWith(isActive: true);
  void stopSession() => state = state.copyWith(isActive: false);

  void setFeedback(ScanFeedback feedback) =>
      state = state.copyWith(lastFeedback: feedback);

  void setImagePath(String? path) =>
      state = state.copyWith(imagePath: path);

  void addOrIncrement(ScannedItem scanned) {
    final existing = state.scannedItems
        .indexWhere((s) => s.barcode == scanned.barcode);
    if (existing >= 0) {
      final updated = List<ScannedItem>.from(state.scannedItems);
      updated[existing] =
          updated[existing].copyWith(quantity: updated[existing].quantity + 1);
      state = state.copyWith(scannedItems: updated);
    } else {
      state = state.copyWith(
          scannedItems: [...state.scannedItems, scanned]);
    }
  }

  void adjustQuantity(String barcode, int delta) {
    final idx =
        state.scannedItems.indexWhere((s) => s.barcode == barcode);
    if (idx < 0) return;
    final updated = List<ScannedItem>.from(state.scannedItems);
    final newQty = (updated[idx].quantity + delta).clamp(1, 9999);
    updated[idx] = updated[idx].copyWith(quantity: newQty);
    state = state.copyWith(scannedItems: updated);
  }

  void removeItem(String barcode) {
    state = state.copyWith(
      scannedItems:
          state.scannedItems.where((s) => s.barcode != barcode).toList(),
    );
  }

  void reset() => state = state.copyWith(
        scannedItems: const [],
        lastFeedback: ScanFeedback.idle,
        isActive: false,
        imagePath: null,
      );
}

/// Auto-disposed per-screen session provider.
final scanSessionProvider = StateNotifierProvider.autoDispose
    .family<ScanSessionNotifier, ScanSessionState, ({OperationMode mode, String sessionId})>(
  (ref, args) => ScanSessionNotifier(args.mode, args.sessionId),
);
