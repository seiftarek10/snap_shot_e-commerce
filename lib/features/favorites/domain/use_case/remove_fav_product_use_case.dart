import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/favorites/domain/repos/favorites_repo.dart';

class RemoveFavProductUseCase extends FutureUseCase<void, String> {
  final FavoritesRepo _favRepo;
  

  RemoveFavProductUseCase(this._favRepo);
  @override
  Future<Result<void>> call(String param) async {
    return await _favRepo.removeFavProduct(id: param);
  }
}
