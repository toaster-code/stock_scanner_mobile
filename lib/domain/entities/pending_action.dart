enum PendingActionType {
  createMovement,
  updateStock,
  syncItem,
}

class PendingAction {
  final String id;
  final PendingActionType type;
  final String payloadId;
  final DateTime queuedAt;
  final bool requiresNetwork;

  PendingAction({
    required this.id,
    required this.type,
    required this.payloadId,
    required this.queuedAt,
    this.requiresNetwork = true,
  });

  PendingAction copyWith({
    String? id,
    PendingActionType? type,
    String? payloadId,
    DateTime? queuedAt,
    bool? requiresNetwork,
  }) {
    return PendingAction(
      id: id ?? this.id,
      type: type ?? this.type,
      payloadId: payloadId ?? this.payloadId,
      queuedAt: queuedAt ?? this.queuedAt,
      requiresNetwork: requiresNetwork ?? this.requiresNetwork,
    );
  }
}
