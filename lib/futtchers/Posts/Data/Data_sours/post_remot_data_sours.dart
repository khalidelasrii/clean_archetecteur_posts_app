import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Data/Models/posts_models.dart';
import 'package:dartz/dartz.dart';

abstract class PostRemotDataSours {
  Future<List<PostModels>> GettAllPosts();
  Future<Unit> DeletPost(int postId);
  Future<Unit> UpdatPost(PostModels postModels);
  Future<Unit> AddPost(PostModels postModels);
}

class PostRemoteDataSourceImpl implements PostRemotDataSours {
  @override
  Future<Unit> AddPost(PostModels postModels) {
    // TODO: implement AddPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> DeletPost(int postId) {
    // TODO: implement DeletPost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModels>> GettAllPosts() {
    // TODO: implement GettAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> UpdatPost(PostModels postModels) {
    // TODO: implement UpdatPost
    throw UnimplementedError();
  }
}
