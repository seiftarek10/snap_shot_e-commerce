import 'package:hive/hive.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String uid;
  @HiveField(1)
  final String userName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final String mobile;
  @HiveField(5)
  final String address;
  @HiveField(6)
  String? customerId;

  UserModel({
    required this.uid,
    required this.userName,
    required this.email,
    required this.password,
    required this.mobile,
    required this.address,
    required this.customerId
  });

  toJson() {
    return {
      'uid': uid,
      'user_name': userName,
      'email': email,
      'mobile': mobile,
      'address': address,
      'customerId':customerId
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['user_name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      mobile: json['mobile'] ?? '',
      address: json['address'] ?? '',
      uid: json['uid'],
      customerId: json['customerId']??''
    );
  }

  factory UserModel.fromEntity(UserEntity data) {
    return UserModel(
      uid: data.uid ?? '',
      userName: data.userName,
      email: data.email,
      password: data.password,
      mobile: data.mobile,
      address: data.address,
      customerId: data.customerId
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
      customerId: customerId??''
    );
  }
}
