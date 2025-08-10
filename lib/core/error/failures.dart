abstract class Failure {
  const Failure([this.message]);
  final String? message;
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure([String? message]) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure([String? message]) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String? message]) : super(message);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure([String? message]) : super(message);
}

class ValidationFailure extends Failure {
  const ValidationFailure([String? message]) : super(message);
}

class UnknownFailure extends Failure {
  const UnknownFailure([String? message]) : super(message);
}
