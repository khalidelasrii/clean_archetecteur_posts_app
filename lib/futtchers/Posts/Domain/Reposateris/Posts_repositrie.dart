import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Entities/Posts.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errure/failures.dart';

abstract class PostsReposetrier {
  Future<Either<Failure, List<Posts>>> GettAllPosts();
  Future<Either<Failure,Unit>> DeletePost(int id);
  Future<Either<Failure,Unit>> UpdatePost(Posts posts);
  Future<Either<Failure,Unit>> addPost(Posts post);
}
