import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/posts_list_screen.dart';
import 'screens/create_post_screen.dart';
import 'screens/edit_post_screen.dart';
import 'screens/about_screen.dart';

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
      title: 'CRUDité',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
          titleLarge: TextStyle(fontWeight: FontWeight.bold),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PostsListScreen(),
        '/create': (context) => const CreatePostScreen(),
        '/about': (context) => const AboutScreen(),
      },
      // On utilise la route nommée "/edit" avec des arguments
      onGenerateRoute: (settings) {
        if (settings.name == '/edit') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => EditPostScreen(post: args['post']),
          );
        }
        return null;
      },
    );
  }
}
