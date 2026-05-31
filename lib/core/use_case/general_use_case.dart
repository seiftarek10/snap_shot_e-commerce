import 'package:snap_shot/core/utils/result.dart';

abstract class FutureUseCase<T, Param> {
  const FutureUseCase();
  Future<Result<T>> call(Param param);
}

abstract class StreamUseCase<T, Param> {
  const StreamUseCase();
  Stream<Result<T>> call(Param param);
}

abstract class UseCase<T, Param> {
  const UseCase();
  Result<T> call(Param param);
}