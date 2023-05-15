import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Reposateris/Posts_repositrie.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errure/failures.dart';
import '../Entities/Posts.dart';

class gettAllPostsUsecase {
  final PostsReposetrier reposetrier;

  gettAllPostsUsecase(this.reposetrier);
  Future<Either<Failure, List<Posts>>> call() async {
    return await reposetrier.GettAllPosts();
  }
}
