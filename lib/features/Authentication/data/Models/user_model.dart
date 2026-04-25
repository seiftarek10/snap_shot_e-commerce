import 'package:snap_shot/core/entites/user_entity.dart';

class UserModel {
   String uid;
  final String userName;
  final String email;
  final String password;
  final String mobile;
  final String address;

  UserModel({
    required this.uid,
    required this.userName,
    required this.email,
    required this.password,
    required this.mobile,
    required this.address,
  });

  toJson() {
    return {
      'uid': uid,
      'user_name': userName,
      'email': email,
      'mobile': mobile,
      'address': address,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['user_name'],
      email: json['email'],
      password: json['password'],
      mobile: json['mobile'],
      address: json['address'],
      uid: json['uid'],
    );
  }

  factory UserModel.fromEntity(UserEntity data) {
    return UserModel(
      uid: data.uid,
      userName: data.userName,
      email: data.email,
      password: data.password,
      mobile: data.mobile,
      address: data.address,
    );
  }

  UserEntity toUSerEntity() {
    return UserEntity(
      uid: uid,
      userName: userName,
      email: email,
      password: password,
      mobile: mobile,
      address: address,
    );
  }
}
