import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/providers/app_providers.dart';
import '../providers/auth_provider.dart';
import '../providers/connectivity_provider.dart';
import '../widgets/connectivity_banner.dart';
import 'inbound/inbound_screen.dart';
import 'inventory/inventory_screen.dart';
import 'outbound/outbound_screen.dart';
import 'sync_status/sync_status_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final pendingAsync = ref.watch(pendingCountProvider);
    final syncUseCase = ref.read(syncQueueUseCaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.homeTitle),
        actions: [
          // Sync button with pending badge
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.sync),
                tooltip: AppStrings.syncButtonLabel,
                onPressed: () async => syncUseCase.flush(),
              ),
              pendingAsync.when(
                data: (count) => count > 0
                    ? Positioned(
                        top: 6,
                        right: 6,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.red,
                          child: Text('$count',
                              style: const TextStyle(
                                  fontSize: 9, color: Colors.white)),
                        ),
                      )
                    : const SizedBox.shrink(),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () => ref.read(authProvider.notifier).logout(),
          ),
        ],
      ),
      body: ConnectivityBanner(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (auth.user != null) ...[
                Text(
                  'Olá, ${auth.user!.username}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 24),
              ],
              // INBOUND
              _ModeCard(
                label: 'ENTRADA',
                subtitle: 'Recebimento de mercadorias',
                icon: Icons.arrow_downward,
                color: AppColors.inbound,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (_) => const InboundScreen()),
                ),
              ),
              const SizedBox(height: 16),
              // OUTBOUND
              _ModeCard(
                label: 'SAÍDA',
                subtitle: 'Separação / expedição',
                icon: Icons.arrow_upward,
                color: AppColors.outbound,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (_) => const OutboundScreen()),
                ),
              ),
              const SizedBox(height: 16),
              // INVENTORY
              _ModeCard(
                label: 'INVENTÁRIO',
                subtitle: 'Contagem física',
                icon: Icons.inventory_2_outlined,
                color: AppColors.inventory,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (_) => const InventoryScreen()),
                ),
              ),
              const Spacer(),
              // Sync status
              OutlinedButton.icon(
                icon: const Icon(Icons.list_alt),
                label: const Text('Ver fila de sincronização'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (_) => const SyncStatusScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  const _ModeCard({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          border: Border.all(color: color.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(12),
        ),
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: color,
              child: Icon(icon, color: Colors.white, size: 26),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: color)),
                Text(subtitle,
                    style: TextStyle(
                        color: Colors.grey.shade600, fontSize: 13)),
              ],
            ),
            const Spacer(),
            Icon(Icons.chevron_right, color: color),
          ],
        ),
      ),
    );
  }
}

