import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../domain/entities/pending_action.dart';
import '../../providers/connectivity_provider.dart';

class SyncStatusScreen extends ConsumerWidget {
  const SyncStatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actionsAsync = ref.watch(allPendingActionsProvider);
    final syncUseCase = ref.read(syncQueueUseCaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Status de Sincronização'),
        actions: [
          actionsAsync.when(
            data: (actions) {
              final pending =
                  actions.where((a) => !a.synced).toList();
              if (pending.isEmpty) return const SizedBox.shrink();
              return IconButton(
                icon: const Icon(Icons.sync),
                tooltip: 'Sincronizar agora',
                onPressed: () async {
                  await syncUseCase.flush();
                },
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: actionsAsync.when(
        data: (actions) {
          if (actions.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_outline,
                      size: 64, color: Colors.green),
                  SizedBox(height: 16),
                  Text('Tudo sincronizado!'),
                ],
              ),
            );
          }
          return ListView.separated(
            itemCount: actions.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) => _ActionTile(action: actions[i]),
          );
        },
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({required this.action});

  final PendingAction action;

  @override
  Widget build(BuildContext context) {
    final icon = _iconFor(action.status);
    final color = _colorFor(action.status);
    final typeLabel = _typeLabel(action.type);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(typeLabel),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ID: ${action.actionId.substring(0, 8)}…'),
          if (action.failReason != null)
            Text(action.failReason!,
                style: const TextStyle(color: Colors.red)),
          Text(
            '${action.attempts} tentativa(s) · '
            '${action.createdAt.toLocal().toString().substring(0, 16)}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      trailing: Chip(
        label: Text(
          _statusLabel(action.status),
          style: TextStyle(color: color, fontSize: 11),
        ),
        backgroundColor: color.withOpacity(0.1),
        side: BorderSide(color: color.withOpacity(0.3)),
      ),
    );
  }

  static IconData _iconFor(PendingActionStatus s) => switch (s) {
        PendingActionStatus.queued => Icons.schedule,
        PendingActionStatus.syncing => Icons.sync,
        PendingActionStatus.done => Icons.check_circle_outline,
        PendingActionStatus.failed => Icons.error_outline,
        PendingActionStatus.dead => Icons.cancel_outlined,
      };

  static Color _colorFor(PendingActionStatus s) => switch (s) {
        PendingActionStatus.queued => Colors.blue,
        PendingActionStatus.syncing => Colors.orange,
        PendingActionStatus.done => Colors.green,
        PendingActionStatus.failed => Colors.red,
        PendingActionStatus.dead => Colors.grey,
      };

  static String _statusLabel(PendingActionStatus s) => switch (s) {
        PendingActionStatus.queued => 'Em fila',
        PendingActionStatus.syncing => 'Sincronizando',
        PendingActionStatus.done => 'Concluído',
        PendingActionStatus.failed => 'Falhou',
        PendingActionStatus.dead => 'Morto',
      };

  static String _typeLabel(String type) => switch (type) {
        'IN' => 'Entrada',
        'OUT' => 'Saída',
        'INVENTORY_COUNT' => 'Contagem',
        _ => type,
      };
}
