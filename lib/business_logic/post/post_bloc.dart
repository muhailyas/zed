import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zed/utils/image_picker/image_picker.dart';
import 'package:zed/data/data_resources/image_upload_to_storage/image_upload_to_storage.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/repositories/post_repositories/post_repositories.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final captionController = TextEditingController();
  PostBloc() : super(PostInitial()) {
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
    event.post.imageUrl = imageUrl;
    await PostRepository().addPost(event.post);
    emit(PostAddSuccess());
  }

  FutureOr<void> openCameraEvent(
      OpenCameraEvent event, Emitter<PostState> emit) async {
    String image = await ImagePickerProvider().pickImage(ImageSource.camera);
    emit(PostState(image: image));
  }

  FutureOr<void> selectImageFromGalleryEvent(
      SelectImageFromGalleryEvent event, Emitter<PostState> emit) async {
    String image = await ImagePickerProvider().pickImage(ImageSource.gallery);
    emit(PostState(image: image));
  }
}