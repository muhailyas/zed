part of 'profile_bloc.dart';

class ProfileEvent {}

class ProfileFetchEvent extends ProfileEvent {
  final String userId;
  ProfileFetchEvent({required this.userId});
}
