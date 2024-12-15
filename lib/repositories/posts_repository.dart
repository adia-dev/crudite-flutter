import 'package:crudite_flutter/data/sources/posts_data_source.dart';
import 'package:crudite_flutter/models/post.dart';

// TODO: move this into a separate file to emulate interface
abstract class PostsRepository {
  Future<List<Post>> getAllPosts();
  Future<Post> createPost(Post post);
  Future<Post> updatePost(Post post);
  Future<void> deletePost(String postId);
}

class FakePostsRepository implements PostsRepository {
  final PostsDataSource dataSource;

  FakePostsRepository(this.dataSource);

  @override
  Future<List<Post>> getAllPosts() => dataSource.getAllPosts();

  @override
  Future<Post> createPost(Post post) => dataSource.createPost(post);

  @override
  Future<Post> updatePost(Post post) => dataSource.updatePost(post);

  @override
  Future<void> deletePost(String postId) => dataSource.deletePost(postId);
}
