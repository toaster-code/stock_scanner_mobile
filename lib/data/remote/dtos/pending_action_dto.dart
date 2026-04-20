import '../../../domain/entities/pending_action.dart';

class PendingActionDto {
  final String actionId;
  final String type;
  final String payload;
  final String createdAt;

  PendingActionDto({
    required this.actionId,
    required this.type,
    required this.payload,
    required this.createdAt,
  });

  factory PendingActionDto.fromJson(Map<String, dynamic> json) {
    return PendingActionDto(
      actionId: json['actionId'] as String,
      type: json['type'] as String,
      payload: json['payload'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'actionId': actionId,
      'type': type,
      'payload': payload,
      'createdAt': createdAt,
    };
  }

  PendingAction toEntity() {
    return PendingAction(
      actionId: actionId,
      type: type,
      payload: payload,
      createdAt: DateTime.parse(createdAt),
    );
  }

  factory PendingActionDto.fromEntity(PendingAction action) {
    return PendingActionDto(
      actionId: action.actionId,
      type: action.type,
      payload: action.payload,
      createdAt: action.createdAt.toIso8601String(),
    );
  }
}

