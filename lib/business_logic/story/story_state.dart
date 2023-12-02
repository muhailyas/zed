part of 'story_bloc.dart';

@freezed
class StoryState with _$StoryState {
  const factory StoryState.initial() = Initial;
  const factory StoryState.recentImagesFetchedSuccess({
    required List<File?> recentImages,
  }) = RecentImagesFetchedSuccess;
  const factory StoryState.imageSelected(
      {required File selectedImage, required bool isCamera}) = ImageSelected;
  const factory StoryState.storyAddedSuccesfully() = StoryAddedSuccesfully;
  const factory StoryState.loading() = Loading;
  const factory StoryState.fetchedArchivedStroiesSuccess({
    required List<Story> stories,
  }) = FetchedArchivedStroiesSuccess;
  const factory StoryState.fetchedArchivedStroiesError(
      {required String error}) = FetchedArchivedStroiesError;
  const factory StoryState.fetchedArchivedStroiesIsEmpty() =
      FetchedArchivedStroiesIsEmpty;
}
