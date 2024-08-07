import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task8_use_api/models/comments_model.dart';
import 'package:task8_use_api/services/get_comments.sevices.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final AllCommentsService _allCommentsService;
  // List<CommentsModel> comment;
  CommentBloc(this._allCommentsService) : super(CommentLoadingState()) {
    on<CommentLoadedEvent>(loadComments);
  }

  Future<void> loadComments(
      CommentLoadedEvent event, Emitter<CommentState> emit) async {
    emit(CommentLoadingState());
    await _allCommentsService
        .getAllComments(id: event.id)
        .then((comments) => emit(CommentDataState(comments: comments)))
        .catchError((errorMessage) =>
            emit(CommentErrorState(errorMessage: errorMessage.toString())));
  }
}
