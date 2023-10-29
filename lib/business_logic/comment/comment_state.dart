part of 'comment_bloc.dart';

class CommentState {}

final class CommentLoading extends CommentState {}

final class CommentFetchSuccess extends CommentState {
  final List<CommentWithUserProfile> comments;
  CommentFetchSuccess({required this.comments});
}

final class CommentFetchFailure extends CommentState {}

final class CommentPostedSuccess extends CommentState {}

final class CommentPostedFailure extends CommentState {}
