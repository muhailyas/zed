import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/models/comment/comment.dart';
import 'package:zed/data/repositories/comment_repository/comment_repository.dart';
part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final TextEditingController commentController = TextEditingController();
  CommentRepository commentRepository;
  CommentBloc(this.commentRepository) : super(CommentLoading()) {
    on<CommentFetchEvent>(commentFetchEvent);
    on<CommentAddEvent>(commentAddEvent);
  }

  FutureOr<void> commentFetchEvent(
      CommentFetchEvent event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    final comments =
        await commentRepository.fetchComments(postId: event.postId);
    await commentRepository.fetchUserProfilesForComments(comments).then(
        (commentsWithUserProfiles) =>
            emit(CommentFetchSuccess(comments: commentsWithUserProfiles)));
  }

  FutureOr<void> commentAddEvent(
      CommentAddEvent event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    final response = await commentRepository.addComment(
        postId: event.comment.postId, comment: event.comment);

    response.fold((error) => emit(CommentPostedFailure()), (success) async {
      emit(CommentPostedSuccess());
    });
  }
}
