import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post.dart';
import '../providers/posts_provider.dart';
import 'post_detail_screen.dart';

class PostsListScreen extends ConsumerWidget {
  const PostsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUDité - Liste des Crudités'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
      body: postsAsyncValue.when(
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.description),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/edit',
                          arguments: {'post': post},
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await ref
                            .read(postsRepositoryProvider)
                            .deletePost(post.id);
                        // Invalider ou rafraîchir le provider pour recharger la liste
                        ref.invalidate(postsListProvider);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${post.title} a été supprimé')),
                        );
                      },
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetailScreen(post: post),
                  ),
                );
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Erreur: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
