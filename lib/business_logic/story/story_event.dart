part of 'story_bloc.dart';

@freezed
class StoryEvent with _$StoryEvent {
  const factory StoryEvent.fetchRecentImages() = FetchRecentImages;
  const factory StoryEvent.selectImageFromGallery() = SelectImageFromGallery;
  const factory StoryEvent.takeImageWithCamera() = TakeImageWithCamera;
  const factory StoryEvent.addToStory({required Story story}) = AddToStory;
}
