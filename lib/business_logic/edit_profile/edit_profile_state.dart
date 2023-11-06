part of 'edit_profile_bloc.dart';

class EditProfileState {
  String? username;
  String? fullname;
  String? bio;
  String? profilePhoto;
  String? coverPhoto;
  EditProfileState({
    this.profilePhoto,
    this.coverPhoto,
    this.bio,
    this.fullname,
    this.username,
  });
}

class EditProfileInitial extends EditProfileState {
  EditProfileInitial({
    super.bio,
    super.coverPhoto,
    super.fullname,
    super.profilePhoto,
    super.username,
  });
}

final class EditProfileLoading extends EditProfileState {}

class CoverPhotoUpdated extends EditProfileState {
  CoverPhotoUpdated({super.coverPhoto, super.profilePhoto});
}

class ProfilePhotoUpdated extends EditProfileState {
  ProfilePhotoUpdated({super.coverPhoto, super.profilePhoto});
}

class ProfileUpdated extends EditProfileState {}
