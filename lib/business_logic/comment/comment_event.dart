part of 'comment_bloc.dart';

class CommentEvent {}

class CommentFetchEvent extends CommentEvent {
  final String postId;
  CommentFetchEvent({required this.postId});
}

class CommentAddEvent extends CommentEvent {
  final Comment comment;
  CommentAddEvent({required this.comment});
}

class CommentDeleteEvent extends CommentEvent {
  final String commentId;
  final String postId;
  CommentDeleteEvent({required this.commentId, required this.postId});
}
