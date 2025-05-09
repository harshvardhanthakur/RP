import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/models/app_model.dart';

class PostRepository {
  Future<void> fetchPosts() async {
    final url = Uri.parse('https://beta.rentprompts.com/api/posts'); // your real payload url
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Posts: ${data['docs']}');
    } else {
      print('Failed to fetch posts: ${response.statusCode}');
    }
  }

  Future<List<AppModel>> fetchApps() async {
    final response = await http.get(Uri.parse('http://beta.rentprompts.com/api/rapps'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((item) => AppModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load apps');
    }
  }
}