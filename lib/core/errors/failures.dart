import 'package:fpdart/fpdart.dart';

/// Sealed failure hierarchy — domain layer.
sealed class Failure {
  const Failure(this.message);
  final String message;
}

/// No connectivity / request timed out.
class NetworkFailure extends Failure {
  const NetworkFailure() : super('Sem conexão com a internet.');
}

/// Server returned an error (4xx / 5xx).
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Local Drift database error.
class LocalDbFailure extends Failure {
  const LocalDbFailure(super.message);
}

/// Business-rule / input validation violation.
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// 401 / token issues — user must re-authenticate.
class AuthFailure extends Failure {
  const AuthFailure() : super('Não autorizado. Faça login novamente.');
}

/// Resource not found locally or remotely.
class NotFoundFailure extends Failure {
  const NotFoundFailure([String message = 'Recurso não encontrado.'])
      : super(message);
}

/// Insufficient stock for an OUTBOUND operation.
class InsufficientStockFailure extends Failure {
  const InsufficientStockFailure()
      : super('Estoque insuficiente para este movimento.');
}

/// Catch-all for unexpected errors.
class UnknownFailure extends Failure {
  const UnknownFailure([String message = 'Erro desconhecido.'])
      : super(message);
}

/// Convenience type alias used by all use cases.
typedef Result<T> = Either<Failure, T>;
