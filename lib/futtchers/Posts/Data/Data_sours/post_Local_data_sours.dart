import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Data/Models/posts_models.dart';
import 'package:dartz/dartz.dart';

abstract class PostLocalDataSours {
  Future<List<PostModels>> getCachedPosts();
 Future<Unit> cachePosts(List<PostModel> postModels);
}
