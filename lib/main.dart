import 'package:crudite_flutter/screens/create_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/posts_list_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: CRUDiteApp(),
    ),
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
      initialRoute: '/',
      routes: {
        '/': (context) => const
            PostsListScreen(),
        '/create': (context) => const CreatePostScreen(),
      },
    );
  }
}
