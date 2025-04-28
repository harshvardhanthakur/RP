import 'dart:convert';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<void> fetchPosts() async {
    final url = Uri.parse('https://rentprompts.com/api/posts'); // your real payload url
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Posts: ${data['docs']}');
    } else {
      print('Failed to fetch posts: ${response.statusCode}');
    }
  }
}