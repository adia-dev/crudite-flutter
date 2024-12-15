import 'package:crudite_flutter/data/sources/fake_posts_data_source.dart';
import 'package:crudite_flutter/data/sources/posts_data_source.dart';
import 'package:crudite_flutter/models/post.dart';
import 'package:crudite_flutter/repositories/posts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postsDataSourceProvider = Provider<PostsDataSource>((ref) {
  return FakePostsDataSource();
});

final postsRepositoryProvider = Provider<PostsRepository>((ref) {
  return FakePostsRepository(ref.read(postsDataSourceProvider));
});

final postsListProvider = FutureProvider<List<Post>>((ref) async {
  return ref.read(postsRepositoryProvider).getAllPosts();
});
