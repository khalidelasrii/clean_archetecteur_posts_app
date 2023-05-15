import 'package:clean_archetecteur_pasts_app/core/errure/failures.dart';
import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Entities/Posts.dart';
import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Reposateris/Posts_repositrie.dart';
import 'package:dartz/dartz.dart';

class UpdatPostUsecase {
  final PostsReposetrier reposetrier;
  UpdatPostUsecase(this.reposetrier);
  Future<Either<Failure, Unit>> call(Posts post) async {
    return await reposetrier.UpdatePost(post);
  }
}
