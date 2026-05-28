class Failure {
  final String errMsg;
  Failure(this.errMsg);
}

class ServerFailure extends Failure {
  ServerFailure({required String errMsg}) : super(errMsg);
}
