part of 'post_bloc.dart';

@immutable
sealed class PostonEvent {}

class LoadedPostsEvent extends PostonEvent {}
