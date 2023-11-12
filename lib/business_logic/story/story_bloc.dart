import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zed/data/data_sources/image_upload_to_storage/image_upload_to_storage.dart';
import 'package:zed/data/models/story/story.dart';
import 'package:zed/data/repositories/story_repository/story_repository.dart';
import 'package:zed/utils/image_picker/image_picker.dart';
part 'story_event.dart';
part 'story_state.dart';
part 'story_bloc.freezed.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final StoryRepository storyRepository;
  StoryBloc(this.storyRepository) : super(const StoryState.initial()) {
    on<FetchRecentImages>((event, emit) async {
      emit(const StoryState.loading());
      final recentImages = await storyRepository.fetchRecentImages();
      emit(StoryState.recentImagesFetchedSuccess(recentImages: recentImages));
    });
    on<SelectImageFromGallery>((event, emit) async {
      final selectedImage =
          await ImagePickerProvider().pickImage(ImageSource.gallery);
      selectedImage != null
          ? emit(StoryState.imageSelected(
              selectedImage: File(selectedImage), isCamera: false))
          : null;
    });
    on<TakeImageWithCamera>((event, emit) async {
      final selectedImage =
          await ImagePickerProvider().pickImage(ImageSource.camera);
      selectedImage != null
          ? emit(StoryState.imageSelected(
              selectedImage: File(selectedImage), isCamera: true))
          : null;
    });
    on<AddToStory>((event, emit) async {
      emit(const StoryState.loading());
      final imageUrl = await FireStoreStorage()
          .uploadImageAndGetUrl(event.story.imageUrl, 'storyImages');
      event.story.imageUrl = imageUrl;
      await storyRepository.addStory(story: event.story);
      return emit(const StoryState.storyAddedSuccesfully());
    });
  }
}
