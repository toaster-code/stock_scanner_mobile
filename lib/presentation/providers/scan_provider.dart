import 'package:flutter/foundation.dart';
import '../../application/scan/create_movement_use_case.dart';
import '../../domain/entities/movement.dart';

class ScanProvider extends ChangeNotifier {
  final CreateMovementUseCase createMovementUseCase;

  bool isSubmitting = false;
  String? resultMessage;

  ScanProvider({required this.createMovementUseCase});

  Future<void> submitMovement(Movement movement) async {
    isSubmitting = true;
    resultMessage = null;
    notifyListeners();

    try {
      await createMovementUseCase.call(movement);
      resultMessage = 'Movimento registrado.';
    } catch (error) {
      resultMessage = 'Erro ao registrar movimento: $error';
    } finally {
      isSubmitting = false;
      notifyListeners();
    }
  }
}
