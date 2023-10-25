part of 'profile_bloc.dart';

class ProfileState {}


class ProfileLoading extends ProfileState {}

class UserInfoFetchSuccess extends ProfileState {
  final UserProfile? userProfile;
  UserInfoFetchSuccess({required this.userProfile});
}

class UserPostsFetchSuccess extends ProfileState {
  final List<Post> posts;
  UserPostsFetchSuccess({required this.posts});
}
