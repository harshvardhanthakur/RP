import 'dart:convert';
import 'package:app/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String domainName = "https://beta.rentprompts.com";

  AuthRepository();

  Future<UserModel?> login(String email, String password) async {
    try {
      print(email);
      print(password);
      final response = await http.post(
        Uri.parse('$domainName/api/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      print('🟢 Response Status Code: ${response.statusCode}');
      print('🟢 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body)["doc"]);
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (err) {
      throw Exception('Error during login: $err');
    }
  }

  Future<UserModel?> signup(
    String email,
    String password,
    int coinBalance,
    String role,
    int tokens,
  ) async {
    try {
      print(password);
      final response = await http.post(
        Uri.parse('$domainName/api/users'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'coinBalance': coinBalance,
          'role': role,
          'tokens': tokens,
        }),
      );

      print(response.statusCode);

      if (response.statusCode == 201) {
        print('Signup response: ${response.body}');
        return UserModel.fromJson(jsonDecode(response.body)["doc"]);
      } else {
        return null;
      }
    } catch (err) {
      throw Exception('Error during signup: $err');
    }
  }
}
