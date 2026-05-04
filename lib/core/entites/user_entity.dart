import 'package:hive_flutter/adapters.dart';

class UserEntity extends HiveObject {
  String uid;
  final String userName;
  final String email;
  final String mobile;
  final String address;
  final String password;

  UserEntity({
    required this.uid,
    required this.userName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.password,
  });
}
