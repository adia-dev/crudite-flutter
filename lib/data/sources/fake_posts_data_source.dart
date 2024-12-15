import 'package:crudite_flutter/models/post.dart';

import 'posts_data_source.dart';

class FakePostsDataSource implements PostsDataSource {
  final List<Post> _fakePosts = [
    Post(
        id: '1',
        title: 'Carottes',
        description:
            "La carotte est une source acceptable de vitamine B, comme la niacine et la vitamine B6, qui aident notre corps à métaboliser l'énergie des aliments."),
    Post(
        id: '2',
        title: 'Concombre',
        description:
            "Il procure un large éventail de minéraux et vitamines (plus concentrés dans sa peau) : du potassium, toutes les vitamines du groupe B, de la vitamine C (8 mg aux 100 g), et un peu de provitamine A et de vitamine E."),
    Post(
        id: '3',
        title: 'Radis',
        description:
            "Une portion de radis participe significativement à la couverture des besoins en vitamine C, permettant de lutter contre la fonte musculaire des séniors. Elle stimule également le système immunitaire et lutte contre le vieillissement cellulaire."),
  ];

  @override
  Future<List<Post>> getAllPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakePosts;
  }

  @override
  Future<Post> createPost(Post post) async {
    await Future.delayed(const Duration(seconds: 1));
    _fakePosts.add(post);
    return post;
  }

  @override
  Future<Post> updatePost(Post post) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _fakePosts.indexWhere((p) => p.id == post.id);
    _fakePosts[index] = post;
    return post;
  }
}
