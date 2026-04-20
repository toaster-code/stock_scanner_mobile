/// Status of a pending action in the local sync queue.
enum PendingActionStatus { queued, syncing, failed, done, dead }

/// A movement operation queued locally, waiting to be synced to the server.
class PendingAction {
  /// Auto-increment local DB surrogate key (null before first save).
  final int? localId;

  /// Client-generated UUID — used as idempotency key on the server.
  final String actionId;

  /// Movement type: IN | OUT | INVENTORY_COUNT
  final String type;

  /// JSON blob matching the server sync action payload format.
  final String payload;

  final bool synced;
  final int attempts;
  final PendingActionStatus status;
  final String? failReason;
  final DateTime createdAt;
  final DateTime? nextRetryAt;

  const PendingAction({
    this.localId,
    required this.actionId,
    required this.type,
    required this.payload,
    this.synced = false,
    this.attempts = 0,
    this.status = PendingActionStatus.queued,
    this.failReason,
    required this.createdAt,
    this.nextRetryAt,
  });

  PendingAction copyWith({
    int? localId,
    String? actionId,
    String? type,
    String? payload,
    bool? synced,
    int? attempts,
    PendingActionStatus? status,
    String? failReason,
    DateTime? createdAt,
    DateTime? nextRetryAt,
  }) {
    return PendingAction(
      localId: localId ?? this.localId,
      actionId: actionId ?? this.actionId,
      type: type ?? this.type,
      payload: payload ?? this.payload,
      synced: synced ?? this.synced,
      attempts: attempts ?? this.attempts,
      status: status ?? this.status,
      failReason: failReason ?? this.failReason,
      createdAt: createdAt ?? this.createdAt,
      nextRetryAt: nextRetryAt ?? this.nextRetryAt,
    );
  }
}

