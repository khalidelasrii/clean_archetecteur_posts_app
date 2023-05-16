import 'package:clean_archetecteur_pasts_app/core/errure/exeption.dart';
import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Entities/Posts.dart';
import 'package:clean_archetecteur_pasts_app/core/errure/failures.dart';
import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Reposateris/Posts_repositrie.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/Network/network_info.dart';
import '../Data_sours/post_Local_data_sours.dart';
import '../Data_sours/post_remot_data_sours.dart';

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
  Future<Either<Failure, Unit>> addPost(Posts post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> DeletePost(int id) {
    // TODO: implement DeletePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> UpdatePost(Posts posts) {
    // TODO: implement UpdatePost
    throw UnimplementedError();
  }
}
