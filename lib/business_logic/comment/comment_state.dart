part of 'comment_bloc.dart';

class CommentState {
  final List<CommentWithUserProfile> comments;
  final UserProfile? user;
  CommentState({required this.comments, this.user});
}

final class CommentLoading extends CommentState {
  CommentLoading({required super.comments, super.user});
}

final class CommentFetchSuccess extends CommentState {
  CommentFetchSuccess({required super.comments, super.user});
}

final class CommentFetchFailure extends CommentState {
  CommentFetchFailure({required super.comments, super.user});
}

final class CommentPostedSuccess extends CommentState {
  CommentPostedSuccess({required super.comments, super.user});
}

final class CommentPostedFailure extends CommentState {
  CommentPostedFailure({required super.comments, super.user});
}
