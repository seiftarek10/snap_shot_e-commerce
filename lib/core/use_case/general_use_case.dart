import 'package:snap_shot/core/utils/result.dart';

abstract class UseCase<T, Param> {
  const UseCase();
  Future<Result<T>> call(Param param);
}

abstract class StreamUseCase<T, Param> {
  const StreamUseCase();
  Stream<Result<T>> call(Param param);
}