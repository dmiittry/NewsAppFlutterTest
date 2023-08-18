import 'package:flutter_project/model/post.dart';
import 'package:flutter_project/rest_api/api.dart';

class PostRepository {
  final PostProvider _postProvider = PostProvider();
  Future<List<Post>> getAllPosts() => _postProvider.getPosts();
}
