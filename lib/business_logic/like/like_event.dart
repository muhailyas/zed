part of 'like_bloc.dart';

class LikeEvent {}

class LikeButtonEvent extends LikeEvent {
  final String postId;
  final String userId;
  final List likes;
  LikeButtonEvent(
      {required this.postId, required this.userId, required this.likes});
}

class LikeFetchEvent extends LikeEvent {
  final String postId;
  LikeFetchEvent({required this.postId});
}
