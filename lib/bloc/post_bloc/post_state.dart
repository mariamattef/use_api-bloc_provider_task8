part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostLoadingStete extends PostState {}

final class PostDataState extends PostState {
  final List<PostModel> posts;

  PostDataState({required this.posts});
}

final class PostErrorState extends PostState {
  final String errorMessage;

  PostErrorState({required this.errorMessage});
}
