import 'package:clean_archetecteur_pasts_app/core/errure/exeption.dart';
import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Data/Models/posts_models.dart';
import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Entities/Posts.dart';
import 'package:clean_archetecteur_pasts_app/core/errure/failures.dart';
import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Reposateris/Posts_repositrie.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/Network/network_info.dart';
import '../Data_sours/post_Local_data_sours.dart';
import '../Data_sours/post_remot_data_sours.dart';

typedef Future<Unit> DeleteOrUpdateOrAddPost();

class PostRepositriUmpl implements PostsReposetrier {
  final PostRemotDataSours remotDatasours;
  final PostLocalDataSours localDataSours;
  final NetworkInfo networkInfo;

  PostRepositriUmpl(
      {required this.remotDatasours,
      required this.localDataSours,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Posts>>> GettAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remotDatasours.GettAllPosts();
        localDataSours.cachePosts(remotePosts);
        return Right(remotePosts);
      } on SercerExeption {
        return Left(ServerFaillure());
      }
    } else {
      try {
        final localPosts = await localDataSours.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheExeption {
        return Left(EmptyCacheFaillure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Posts post) async {
    final PostModels postModels =
        PostModels(id: post.id, title: post.title, completed: post.completed);
    return await _getMessage(() {
      return remotDatasours.AddPost(postModels);
    });
  }

  @override
  Future<Either<Failure, Unit>> DeletePost(int postId) async {
    return await _getMessage(() {
      return remotDatasours.DeletPost(postId);
    });
  }

  @override
  Future<Either<Failure, Unit>> UpdatePost(Posts posts) async {
    final PostModels postModels = PostModels(
        id: posts.id, title: posts.title, completed: posts.completed);
    return await _getMessage(() {
      return remotDatasours.UpdatPost(postModels);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      DeleteOrUpdateOrAddPost deleteOrUpdateOrAddPost) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddPost();
        return Right(unit);
      } on SercerExeption {
        return Left(ServerFaillure());
      }
    } else {
      return Left(OfflineFaillure());
    }
  }
}
