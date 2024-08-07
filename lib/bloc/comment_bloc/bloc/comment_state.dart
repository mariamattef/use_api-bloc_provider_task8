part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentLoadingState extends CommentState {}

final class CommentDataState extends CommentState {
  final List<CommentsModel> comments;

  CommentDataState({required this.comments});
}

final class CommentErrorState extends CommentState {
  final String errorMessage;

  CommentErrorState({required this.errorMessage});
}
