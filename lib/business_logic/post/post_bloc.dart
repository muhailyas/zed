import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zed/data/repositories/user_repositories/user_repositories.dart';
import 'package:zed/utils/image_picker/image_picker.dart';
import 'package:zed/data/data_resources/image_upload_to_storage/image_upload_to_storage.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/repositories/post_repositories/post_repositories.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final captionController = TextEditingController();
  PostRepository postRepository;
  UserRepository userRepository;
  PostBloc(this.postRepository, this.userRepository) : super(PostInitial()) {
    on<ClosePostScreenEvent>(closePostScreenEvent);
    on<AddPostEvent>(addPostEvent);
    on<OpenCameraEvent>(openCameraEvent);
    on<SelectImageFromGalleryEvent>(selectImageFromGalleryEvent);
  }

  FutureOr<void> closePostScreenEvent(
      ClosePostScreenEvent event, Emitter<PostState> emit) {
    emit(ClosePostScreenToHome());
  }

  FutureOr<void> addPostEvent(
      AddPostEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());

    final imageUrl = await FireStoreStorage()
        .uploadImageAndGetUrl(event.post.imageUrl, 'posts');
    final user = await userRepository
        .getUserByUid(FirebaseAuth.instance.currentUser!.uid);
    event.post.profileUrl = user == null ? '' : user.profilePhoto;
    event.post.username = user == null ? '' : user.userName;
    event.post.imageUrl = imageUrl;
    await postRepository.addPost(event.post);
    emit(PostAddSuccess());
  }

  FutureOr<void> openCameraEvent(
      OpenCameraEvent event, Emitter<PostState> emit) async {
    String? image = await ImagePickerProvider().pickImage(ImageSource.camera);
    emit(PostImageSelected(image: image));
  }

  FutureOr<void> selectImageFromGalleryEvent(
      SelectImageFromGalleryEvent event, Emitter<PostState> emit) async {
    String? image = await ImagePickerProvider().pickImage(ImageSource.gallery);
    emit(PostImageSelected(image: image));
  }
}
