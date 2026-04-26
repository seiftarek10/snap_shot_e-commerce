import 'package:hive_flutter/adapters.dart';
part 'user_entity.g.dart';
@HiveType(typeId: 0)
class UserEntity extends HiveObject {
  @HiveField(0)
   String uid;
  @HiveField(1)
   final String userName;
  @HiveField(2)
   final String email;
  @HiveField(3)
   final String mobile;
  @HiveField(4)
   final String address;
  @HiveField(5)
   final String password;

  UserEntity({
    required this.uid,
    required this.userName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.password
  });
}
