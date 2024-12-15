import 'package:flutter/material.dart';
import 'screens/posts_list_screen.dart';

void main() {
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
      initialRoute: '/',
      routes: {
        '/': (context) => const PostsListScreen(),
        // TODO: Implement the rest of the crud you lazy idiot
      },
    );
  }
}
