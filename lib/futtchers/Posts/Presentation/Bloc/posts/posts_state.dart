part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsStete extends PostsState {
  final List<Posts> posts;

  LoadedPostsStete({required this.posts});

  List<Object> get props => [posts];
}

class ErrorPostsState extends PostsState {
  final String message;
  ErrorPostsState({required this.message});
}
