import 'package:snap_shot/core/errors/failure.dart';

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);
}

class FireStoreFailure extends Failure{
  const FireStoreFailure(super.errMessage);
}

class AuthFailure extends Failure{
  const AuthFailure(super.errMessage);
}

class NetworkFailure extends Failure{
 const NetworkFailure(super.errMessage);
}
