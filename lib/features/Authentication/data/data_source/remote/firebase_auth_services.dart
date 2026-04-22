import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:snap_shot/features/authentication/domain/use_case/params/sing_up_param.dart';

class FirebaseAuthServices implements AuthRemoteDataSource {
  FirebaseAuthServices._();

  static final FirebaseAuthServices instance = FirebaseAuthServices._();

  Future<String?> _getUserId({required SignUpParam request}) async {
    final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );
    return result.user?.uid;
  }

  @override
  Future<UserEntity> signUp({required SignUpParam request}) async {
    String? uid = await _getUserId(request: request);
    return UserEntity(
      uid: uid ?? '',
      userName: "userName",
      email: "email",
      mobile: "mobile",
      address: "address",
    );
  }
}
