part of 'edit_profile_bloc.dart';

class EditProfileEvent {}

class EditPageInitialEvent extends EditProfileEvent {
  final String fullname;
  final String username;
  final String bio;
  final String profile;
  final String cover;
  EditPageInitialEvent(
      {required this.fullname,
      required this.username,
      required this.bio,
      required this.cover,
      required this.profile});
}

class UpdateButtonClickEvent extends EditProfileEvent {
  final UserProfile userProfile;
  UpdateButtonClickEvent({required this.userProfile});
}

class EditCoverPhotoClickEvent extends EditProfileEvent {}

class EditProfilePhotoClickEvent extends EditProfileEvent {}
