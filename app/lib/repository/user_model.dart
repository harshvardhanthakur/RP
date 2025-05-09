class UserModel {
  final String email;
  final String? token;

  UserModel({required this.email, this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      token: json['token'], // Adjust this field name if needed
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'token': token};
  }
}