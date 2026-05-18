class UserEntity {
  final String? uid;
  final String userName;
  final String email;
  final String mobile;
  final String address;
  final String password;
  final String customerId;

  UserEntity({
    required this.uid,
    required this.userName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.password,
    required this.customerId,
  });

  UserEntity copyWith({String? uid, String? customerId}) {
    return UserEntity(
      uid: uid ?? this.uid,
      userName: userName,
      email: email,
      mobile: mobile,
      address: address,
      password: password,
      customerId: customerId ?? this.customerId,
    );
  }
}
