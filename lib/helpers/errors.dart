abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class AuthError extends Failure {
  AuthError(super.errMessage);

  factory AuthError.fromSupaError(String error) {
    return AuthError(error);
  }
}
