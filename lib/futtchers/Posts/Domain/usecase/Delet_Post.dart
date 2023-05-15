import 'package:clean_archetecteur_pasts_app/core/errure/failures.dart';
import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Reposateris/Posts_repositrie.dart';
import 'package:dartz/dartz.dart';

class DeletePostUsecase {
  final PostsReposetrier reposetrier;
  DeletePostUsecase(this.reposetrier);
  Future<Either<Failure, Unit>> call(int postId) async {
    return await reposetrier.DeletePost(postId);
  }
}
