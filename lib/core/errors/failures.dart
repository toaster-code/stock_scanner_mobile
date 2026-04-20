abstract class Failure {
  final String message;

  Failure(this.message);
}

class NotFoundFailure extends Failure {
  NotFoundFailure() : super('Recurso não encontrado.');
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('Falha de rede.');
}
