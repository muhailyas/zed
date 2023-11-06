import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zed/data/data_sources/image_upload_to_storage/image_upload_to_storage.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/data/repositories/user_repository/user_repositories.dart';
import 'package:zed/utils/image_picker/image_picker.dart';
part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  UserRepository userRepository;
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final bioController = TextEditingController();
  EditProfileBloc(this.userRepository) : super(EditProfileInitial()) {
    on<EditCoverPhotoClickEvent>(editCoverPhotoClickEvent);
    on<EditProfilePhotoClickEvent>(editProfilePhotoClickEvent);
    on<UpdateButtonClickEvent>(updateButtonClickEvent);
    on<EditPageInitialEvent>(editPageInitialEvent);
  }

  FutureOr<void> editCoverPhotoClickEvent(
      EditCoverPhotoClickEvent event, Emitter<EditProfileState> emit) async {
    final image = await ImagePickerProvider().pickImage(ImageSource.gallery);
    emit(CoverPhotoUpdated(coverPhoto: image));
  }

  FutureOr<void> editProfilePhotoClickEvent(
      EditProfilePhotoClickEvent event, Emitter<EditProfileState> emit) async {
    final image = await ImagePickerProvider().pickImage(ImageSource.gallery);
    emit(ProfilePhotoUpdated(profilePhoto: image));
  }

  FutureOr<void> updateButtonClickEvent(
      UpdateButtonClickEvent event, Emitter<EditProfileState> emit) async {
    emit(EditProfileLoading());
    final profilePhoto = await FireStoreStorage()
        .uploadImageAndGetUrl(event.userProfile.profilePhoto, 'profile');
    final coverPhoto = await FireStoreStorage()
        .uploadImageAndGetUrl(event.userProfile.coverPhoto, 'cover');
    event.userProfile.profilePhoto = profilePhoto;
    event.userProfile.coverPhoto = coverPhoto;
    await Future.delayed(const Duration(seconds: 2));
    await userRepository.updateUser(event.userProfile);
    emit(ProfileUpdated());
  }

  FutureOr<void> editPageInitialEvent(
      EditPageInitialEvent event, Emitter<EditProfileState> emit) {
    nameController.text = event.fullname;
    userNameController.text = event.username;
    bioController.text = event.bio;
    emit(EditProfileInitial(
        coverPhoto: event.cover, profilePhoto: event.profile));
  }
}
