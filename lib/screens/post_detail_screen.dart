import 'package:flutter/material.dart';
import '../models/post.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(post.description),
      ),
    );
  }
}
