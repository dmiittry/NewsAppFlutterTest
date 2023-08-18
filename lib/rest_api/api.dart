import 'dart:convert';
import 'package:flutter_project/model/post.dart';
import 'package:http/http.dart' as http;

class PostProvider {
  // https://jsonplaceholder.typicode.com/posts
  // https://jsonplaceholder.typicode.com/photos

  Future<List<Post>> getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> postListJson = json.decode(response.body);
      return postListJson.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Error api posts');
    }
  }
}
