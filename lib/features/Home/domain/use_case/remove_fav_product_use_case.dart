import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/domain/repo/home_repo.dart';

class RemoveFavProductUseCase extends UseCase<void, String> {
  final HomeRepo _homeRepo;

  RemoveFavProductUseCase(this._homeRepo);
  @override
  Future<Result<void>> call(String param) async {
    return await _homeRepo.removeFavProduct(id: param);
  }
}
