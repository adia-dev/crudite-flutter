import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post.dart';
import '../providers/posts_provider.dart';

class EditPostScreen extends ConsumerStatefulWidget {
  final Post post;

  const EditPostScreen({required this.post, Key? key}) : super(key: key);

  @override
  ConsumerState<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends ConsumerState<EditPostScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.post.title);
    descriptionController =
        TextEditingController(text: widget.post.description);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modifier la Crudité')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Nom de la Crudité'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final updatedPost = widget.post.copyWith(
                  title: titleController.text.trim(),
                  description: descriptionController.text.trim(),
                );

                await ref.read(postsRepositoryProvider).updatePost(updatedPost);

                // Après la mise à jour, on réactualise la liste
                ref.invalidate(postsListProvider);

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('${updatedPost.title} a été mis à jour')),
                );
              },
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
