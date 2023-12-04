import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/data_sources/user_data_source/user_data_source.dart';
import 'package:zed/data/models/comment/comment.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/data/repositories/comment_repository/comment_repository.dart';
part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final TextEditingController commentController = TextEditingController();
  CommentRepository commentRepository;
  CommentBloc(this.commentRepository) : super(CommentLoading(comments: [])) {
    on<CommentFetchEvent>(commentFetchEvent);
    on<CommentAddEvent>(commentAddEvent);
    on<CommentDeleteEvent>(commentDeleteEvent);
  }
  List<CommentWithUserProfile> _comments = [];
  FutureOr<void> commentFetchEvent(
      CommentFetchEvent event, Emitter<CommentState> emit) async {
    emit(CommentLoading(comments: []));
    final user = await UserDataSource()
        .getUserByUid(FirebaseAuth.instance.currentUser!.uid);
    final comments =
        await commentRepository.fetchComments(postId: event.postId);
    await commentRepository
        .fetchUserProfilesForComments(comments)
        .then((commentsWithUserProfiles) {
      _comments = commentsWithUserProfiles;
      emit(CommentFetchSuccess(comments: commentsWithUserProfiles, user: user));
    });
  }

  FutureOr<void> commentAddEvent(
      CommentAddEvent event, Emitter<CommentState> emit) async {
    final user = await UserDataSource()
        .getUserByUid(FirebaseAuth.instance.currentUser!.uid);
    await commentRepository.addComment(
        postId: event.comment.postId, comment: event.comment);
    commentRepository.incrementCommentCount(postId: event.comment.postId);
    final comments =
        await commentRepository.fetchComments(postId: event.comment.postId);
    await commentRepository.fetchUserProfilesForComments(comments).then(
        (commentsWithUserProfiles) => emit(CommentFetchSuccess(
            comments: commentsWithUserProfiles, user: user)));
  }

  FutureOr<void> commentDeleteEvent(
      CommentDeleteEvent event, Emitter<CommentState> emit) async {
    _comments.removeWhere((comment) => comment.comment.id == event.commentId);
    final user = await UserDataSource()
        .getUserByUid(FirebaseAuth.instance.currentUser!.uid);
    emit(CommentFetchSuccess(comments: _comments, user: user));
    await commentRepository.deleteComment(
        commentId: event.commentId, postId: event.postId);
    await commentRepository.decrementCommentCount(postId: event.postId);
  }
}
