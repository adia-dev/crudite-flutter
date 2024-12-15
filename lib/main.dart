import 'package:flutter/material.dart';
import 'package:crudite_flutter/data/sources/fake_posts_data_source.dart';
import 'package:crudite_flutter/repositories/posts_repository.dart';

void main() {
  testRepository();
  runApp(
    const CRUDiteApp(),
  );
}

class CRUDiteApp extends StatelessWidget {
  const CRUDiteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlaceholderPage(),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter CRUD App')),
      body: const Center(child: Text('Hlo World')),
    );
  }
}

void testRepository() async {
  final dataSource = FakePostsDataSource();
  final repository = FakePostsRepository(dataSource);

  final posts = await repository.getAllPosts();
  print(posts.map((post) => post.title).toList());
}
