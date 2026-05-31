import 'package:snap_shot/core/entites/user_entity.dart';

class OtpArgsModel {
  final UserEntity user;
  final String verificationId;

  OtpArgsModel({required this.user, required this.verificationId});
}
