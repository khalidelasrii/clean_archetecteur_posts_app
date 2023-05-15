import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Entities/Posts.dart';
import 'package:clean_archetecteur_pasts_app/core/errure/failures.dart';
import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Reposateris/Posts_repositrie.dart';
import 'package:dartz/dartz.dart';

class PostRepositriUmpl implements PostsReposetrier {
  final PostRemotDataSours remotDatasours;
  final PostLocalDataSours localDataSours;

PostRepositriUmpl({
  required this.remotDatasours,required this.localDataSours
})
  @override
  Future<Either<Failure, List<Posts>>> GettAllPosts() async {
    await remotDatasours.gettAllPost();
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
