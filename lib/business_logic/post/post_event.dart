part of 'post_bloc.dart';

class PostEvent {}

class ClosePostScreenEvent extends PostEvent {}

class AddPostEvent extends PostEvent {
  final Post post;
  AddPostEvent({required this.post});
}

class OpenCameraEvent extends PostEvent {}

class SelectImageFromGalleryEvent extends PostEvent {}

class FetchPostsOrSavedPosts extends PostEvent {
  final bool isSavedPost;
  FetchPostsOrSavedPosts({required this.isSavedPost});
}
