import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task8_use_api/models/comments_model.dart';
import 'package:task8_use_api/models/post_model.dart';
import 'package:task8_use_api/services/get_comments.sevices.dart';
import 'package:task8_use_api/services/get_posts.services.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostonEvent, PostState> {
  final AllPostsService _allPostsService;

  PostBloc(this._allPostsService) : super(PostLoadingStete()) {
    on<LoadedPostsEvent>(loadPosts);
  }
  Future<void> loadPosts(
      LoadedPostsEvent event, Emitter<PostState> emit) async {
    emit(PostLoadingStete());
    await _allPostsService
        .getAllPosts()
        .then((posts) => emit(PostDataState(posts: posts)))
        .catchError((errorMessage) =>
            emit(PostErrorState(errorMessage: errorMessage.toString())));
  }
}
