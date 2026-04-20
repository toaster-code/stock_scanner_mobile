import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_colors.dart';
import '../../core/network/connectivity_service.dart';
import '../providers/connectivity_provider.dart';

/// Wraps [child] and prepends a persistent amber banner when offline.
///
/// The banner displays the number of operations queued locally.
class ConnectivityBanner extends ConsumerWidget {
  const ConnectivityBanner({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivityAsync = ref.watch(connectivityProvider);
    final pendingAsync = ref.watch(pendingCountProvider);

    return connectivityAsync.when(
      data: (status) {
        if (status == ConnectivityStatus.online) return child;
        final count = pendingAsync.asData?.value ?? 0;
        return Column(
          children: [
            Material(
              color: AppColors.offlineBanner,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: Row(
                    children: [
                      const Icon(Icons.cloud_off,
                          color: Colors.white, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          count == 0
                              ? 'Offline'
                              : 'Offline — $count operações em fila',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: child),
          ],
        );
      },
      loading: () => child,
      error: (_, __) => child,
    );
  }
}
