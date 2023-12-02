class UserModel {
  final String userName;
  final String email;
  final String password;
  final String timeCreated;
  final String userId;

  UserModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.timeCreated,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'email': email,
      'password': password,
      'timeCreated': timeCreated,
      'userId': userId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      timeCreated: map['timeCreated'],
      userId: map['userId'] as String,
    );
  }

  

}