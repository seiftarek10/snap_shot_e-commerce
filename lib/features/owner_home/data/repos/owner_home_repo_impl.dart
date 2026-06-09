import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/core/errors/failure.dart';
import 'package:snap_shot/core/errors/firesotre_error.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/owner_home/data/data_source/remote_data_source/owner_home_remote.dart';
import 'package:snap_shot/features/owner_home/domain/entites/stats_entity.dart';
import 'package:snap_shot/features/owner_home/domain/repos/owner_home_repo.dart';

class OwnerHomeRepoImpl implements OwnerHomeRepo {
  final OwnerHomeRemoteDataSource _homeRemote;

  OwnerHomeRepoImpl(this._homeRemote);
  @override
  Future<Result<StatsEntity>> getStatsData() async {
    try {
      final result = await _homeRemote.getStatsData();

      StatsEntity data = result.toEntity();
      return Success(data);
    } catch (e) {
      if (e is FirebaseException) {
        return AppFailure(FirestoreError.handleFireStoreError(e));
      }
      return AppFailure(Failure(e.toString()));
    }
  }
}
