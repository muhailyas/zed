part of 'user_bloc.dart';

class UserEvent {}

class CreateUserEvent extends UserEvent {
  final UserProfile userProfile;
  CreateUserEvent({required this.userProfile});
}
