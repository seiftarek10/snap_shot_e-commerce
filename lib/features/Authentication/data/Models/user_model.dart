import 'package:snap_shot/core/entites/user_entity.dart';

class UserModel {
  final String uid;
  final String userName;
  final String email;
  final String mobile;
  final String address;

  UserModel({
    required this.uid,
    required this.userName,
    required this.email,
    required this.mobile,
    required this.address,
  });

  tJson() {
    return {
      'uid':uid,
      'user_name': userName,
      'email': email,
      'mobile': mobile,
      'address': address,
    };
  }

  fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['user_name'],
      email: json['email'],
      mobile: json['mobile'],
      address: json['address'],
      uid: json['uid'],
    );
  }

  UserEntity toUSerEntity() {
    return UserEntity(
      uid: uid,
      userName: userName,
      email: email,
      mobile: mobile,
      address: address,
    );
  }
}
