part of 'comment_bloc.dart';

class CommentState {
  final List<CommentWithUserProfile> comments;
  CommentState({required this.comments});
}

final class CommentLoading extends CommentState {
  CommentLoading({required super.comments});
}

final class CommentFetchSuccess extends CommentState {
  CommentFetchSuccess({required super.comments});
}

final class CommentFetchFailure extends CommentState {
  CommentFetchFailure({required super.comments});
}

final class CommentPostedSuccess extends CommentState {
  CommentPostedSuccess({required super.comments});
}

final class CommentPostedFailure extends CommentState {
  CommentPostedFailure({required super.comments});
}
