part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class CommentLoadedEvent extends CommentEvent {
  final int id;
  CommentLoadedEvent({required this.id});
}
