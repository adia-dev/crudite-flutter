import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post.dart';
import '../providers/posts_provider.dart';

class CreatePostScreen extends ConsumerWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Créer une Crudité')),
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
                final post = Post(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: titleController.text.trim(),
                  description: descriptionController.text.trim(),
                );

                await ref.read(postsRepositoryProvider).createPost(post);

                // NOTE: Invalider ou rafraîchir pour recharger la liste après la création
                // TODO: gere ça d'une meilleur maniere
                ref.invalidate(postsListProvider);

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${post.title} a été créé')),
                );
              },
              child: const Text('Créer'),
            ),
          ],
        ),
      ),
    );
  }
}
