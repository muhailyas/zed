part of 'profile_bloc.dart';

class ProfileEvent {}

class UserInfoFetchEvent extends ProfileEvent {
  final String userId;
  UserInfoFetchEvent({required this.userId});
}

class UserPostsFetchEvent extends ProfileEvent {}
