import 'package:flutter/material.dart';

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
      body: const Center(child: Text('Hello World')),
    );
  }
}
