import '../../../domain/entities/pending_action.dart';

class PendingActionDto {
  final String id;
  final String type;
  final String payloadId;
  final String queuedAt;
  final bool requiresNetwork;

  PendingActionDto({
    required this.id,
    required this.type,
    required this.payloadId,
    required this.queuedAt,
    required this.requiresNetwork,
  });

  factory PendingActionDto.fromJson(Map<String, dynamic> json) {
    return PendingActionDto(
      id: json['id'] as String,
      type: json['type'] as String,
      payloadId: json['payloadId'] as String,
      queuedAt: json['queuedAt'] as String,
      requiresNetwork: json['requiresNetwork'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'payloadId': payloadId,
      'queuedAt': queuedAt,
      'requiresNetwork': requiresNetwork,
    };
  }

  PendingAction toEntity() {
    return PendingAction(
      id: id,
      type: PendingActionType.values.firstWhere(
        (value) => value.name == type,
        orElse: () => PendingActionType.createMovement,
      ),
      payloadId: payloadId,
      queuedAt: DateTime.parse(queuedAt),
      requiresNetwork: requiresNetwork,
    );
  }

  factory PendingActionDto.fromEntity(PendingAction action) {
    return PendingActionDto(
      id: action.id,
      type: action.type.name,
      payloadId: action.payloadId,
      queuedAt: action.queuedAt.toIso8601String(),
      requiresNetwork: action.requiresNetwork,
    );
  }
}
