import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Data/Models/posts_models.dart';

abstract class PostLocalDataSours {
  Future<List<PostModels>> getCachedPosts();
}
