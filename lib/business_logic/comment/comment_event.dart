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

class CommentDeleteEvent extends CommentEvent {}
