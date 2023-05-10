import 'package:dartz/dartz.dart';

import '../../../../core/errure/failures.dart';
import '../Entities/Posts.dart';
import '../Reposateris/Posts_repositrie.dart';

class AddPostUsecase {
  final PostsReposetrier reposetrier;
  AddPostUsecase(this.reposetrier);
  Future<Either<Failure, Unit>> call(Posts post) async {
    return await reposetrier.addPost(post);
  }
}
