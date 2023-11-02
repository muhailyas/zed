part of 'profile_bloc.dart';

class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileFetchSuccess extends ProfileState {
  final UserProfile? userProfile;
  final List<Post> posts;
  final List<Post> savedPosts;
  ProfileFetchSuccess(
      {required this.userProfile,
      required this.posts,
      required this.savedPosts});
}
