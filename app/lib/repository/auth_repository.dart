import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String domainName = "https://rentprompts.com";

  AuthRepository();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$domainName/api/users/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (err) {
      throw Exception('Error during login: $err');
    }
  }

  Future<Map<String, dynamic>> signup(String email, String password, int coinBalance, String role, int tokens) async {
    try {
      final response = await http.post(
        Uri.parse('$domainName/api/users'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          'coinBalance': coinBalance,
          'role': role,
          'tokens': tokens,
        }),
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        print('Signup response: ${response.body}');
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to signup: ${response.body}');
      }
    } catch (err) {
      throw Exception('Error during signup: $err');
    }
  }
}