// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentImages,
    required TResult Function() selectImageFromGallery,
    required TResult Function() takeImageWithCamera,
    required TResult Function(Story story) addToStory,
    required TResult Function() fetchArchivedStroies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentImages,
    TResult? Function()? selectImageFromGallery,
    TResult? Function()? takeImageWithCamera,
    TResult? Function(Story story)? addToStory,
    TResult? Function()? fetchArchivedStroies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentImages,
    TResult Function()? selectImageFromGallery,
    TResult Function()? takeImageWithCamera,
    TResult Function(Story story)? addToStory,
    TResult Function()? fetchArchivedStroies,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentImages value) fetchRecentImages,
    required TResult Function(SelectImageFromGallery value)
        selectImageFromGallery,
    required TResult Function(TakeImageWithCamera value) takeImageWithCamera,
    required TResult Function(AddToStory value) addToStory,
    required TResult Function(FetchArchivedStroies value) fetchArchivedStroies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentImages value)? fetchRecentImages,
    TResult? Function(SelectImageFromGallery value)? selectImageFromGallery,
    TResult? Function(TakeImageWithCamera value)? takeImageWithCamera,
    TResult? Function(AddToStory value)? addToStory,
    TResult? Function(FetchArchivedStroies value)? fetchArchivedStroies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentImages value)? fetchRecentImages,
    TResult Function(SelectImageFromGallery value)? selectImageFromGallery,
    TResult Function(TakeImageWithCamera value)? takeImageWithCamera,
    TResult Function(AddToStory value)? addToStory,
    TResult Function(FetchArchivedStroies value)? fetchArchivedStroies,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryEventCopyWith<$Res> {
  factory $StoryEventCopyWith(
          StoryEvent value, $Res Function(StoryEvent) then) =
      _$StoryEventCopyWithImpl<$Res, StoryEvent>;
}

/// @nodoc
class _$StoryEventCopyWithImpl<$Res, $Val extends StoryEvent>
    implements $StoryEventCopyWith<$Res> {
  _$StoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchRecentImagesImplCopyWith<$Res> {
  factory _$$FetchRecentImagesImplCopyWith(_$FetchRecentImagesImpl value,
          $Res Function(_$FetchRecentImagesImpl) then) =
      __$$FetchRecentImagesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchRecentImagesImplCopyWithImpl<$Res>
    extends _$StoryEventCopyWithImpl<$Res, _$FetchRecentImagesImpl>
    implements _$$FetchRecentImagesImplCopyWith<$Res> {
  __$$FetchRecentImagesImplCopyWithImpl(_$FetchRecentImagesImpl _value,
      $Res Function(_$FetchRecentImagesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchRecentImagesImpl
    with DiagnosticableTreeMixin
    implements FetchRecentImages {
  const _$FetchRecentImagesImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryEvent.fetchRecentImages()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'StoryEvent.fetchRecentImages'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchRecentImagesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentImages,
    required TResult Function() selectImageFromGallery,
    required TResult Function() takeImageWithCamera,
    required TResult Function(Story story) addToStory,
    required TResult Function() fetchArchivedStroies,
  }) {
    return fetchRecentImages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentImages,
    TResult? Function()? selectImageFromGallery,
    TResult? Function()? takeImageWithCamera,
    TResult? Function(Story story)? addToStory,
    TResult? Function()? fetchArchivedStroies,
  }) {
    return fetchRecentImages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentImages,
    TResult Function()? selectImageFromGallery,
    TResult Function()? takeImageWithCamera,
    TResult Function(Story story)? addToStory,
    TResult Function()? fetchArchivedStroies,
    required TResult orElse(),
  }) {
    if (fetchRecentImages != null) {
      return fetchRecentImages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentImages value) fetchRecentImages,
    required TResult Function(SelectImageFromGallery value)
        selectImageFromGallery,
    required TResult Function(TakeImageWithCamera value) takeImageWithCamera,
    required TResult Function(AddToStory value) addToStory,
    required TResult Function(FetchArchivedStroies value) fetchArchivedStroies,
  }) {
    return fetchRecentImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentImages value)? fetchRecentImages,
    TResult? Function(SelectImageFromGallery value)? selectImageFromGallery,
    TResult? Function(TakeImageWithCamera value)? takeImageWithCamera,
    TResult? Function(AddToStory value)? addToStory,
    TResult? Function(FetchArchivedStroies value)? fetchArchivedStroies,
  }) {
    return fetchRecentImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentImages value)? fetchRecentImages,
    TResult Function(SelectImageFromGallery value)? selectImageFromGallery,
    TResult Function(TakeImageWithCamera value)? takeImageWithCamera,
    TResult Function(AddToStory value)? addToStory,
    TResult Function(FetchArchivedStroies value)? fetchArchivedStroies,
    required TResult orElse(),
  }) {
    if (fetchRecentImages != null) {
      return fetchRecentImages(this);
    }
    return orElse();
  }
}

abstract class FetchRecentImages implements StoryEvent {
  const factory FetchRecentImages() = _$FetchRecentImagesImpl;
}

/// @nodoc
abstract class _$$SelectImageFromGalleryImplCopyWith<$Res> {
  factory _$$SelectImageFromGalleryImplCopyWith(
          _$SelectImageFromGalleryImpl value,
          $Res Function(_$SelectImageFromGalleryImpl) then) =
      __$$SelectImageFromGalleryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectImageFromGalleryImplCopyWithImpl<$Res>
    extends _$StoryEventCopyWithImpl<$Res, _$SelectImageFromGalleryImpl>
    implements _$$SelectImageFromGalleryImplCopyWith<$Res> {
  __$$SelectImageFromGalleryImplCopyWithImpl(
      _$SelectImageFromGalleryImpl _value,
      $Res Function(_$SelectImageFromGalleryImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SelectImageFromGalleryImpl
    with DiagnosticableTreeMixin
    implements SelectImageFromGallery {
  const _$SelectImageFromGalleryImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryEvent.selectImageFromGallery()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'StoryEvent.selectImageFromGallery'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectImageFromGalleryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentImages,
    required TResult Function() selectImageFromGallery,
    required TResult Function() takeImageWithCamera,
    required TResult Function(Story story) addToStory,
    required TResult Function() fetchArchivedStroies,
  }) {
    return selectImageFromGallery();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentImages,
    TResult? Function()? selectImageFromGallery,
    TResult? Function()? takeImageWithCamera,
    TResult? Function(Story story)? addToStory,
    TResult? Function()? fetchArchivedStroies,
  }) {
    return selectImageFromGallery?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentImages,
    TResult Function()? selectImageFromGallery,
    TResult Function()? takeImageWithCamera,
    TResult Function(Story story)? addToStory,
    TResult Function()? fetchArchivedStroies,
    required TResult orElse(),
  }) {
    if (selectImageFromGallery != null) {
      return selectImageFromGallery();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentImages value) fetchRecentImages,
    required TResult Function(SelectImageFromGallery value)
        selectImageFromGallery,
    required TResult Function(TakeImageWithCamera value) takeImageWithCamera,
    required TResult Function(AddToStory value) addToStory,
    required TResult Function(FetchArchivedStroies value) fetchArchivedStroies,
  }) {
    return selectImageFromGallery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentImages value)? fetchRecentImages,
    TResult? Function(SelectImageFromGallery value)? selectImageFromGallery,
    TResult? Function(TakeImageWithCamera value)? takeImageWithCamera,
    TResult? Function(AddToStory value)? addToStory,
    TResult? Function(FetchArchivedStroies value)? fetchArchivedStroies,
  }) {
    return selectImageFromGallery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentImages value)? fetchRecentImages,
    TResult Function(SelectImageFromGallery value)? selectImageFromGallery,
    TResult Function(TakeImageWithCamera value)? takeImageWithCamera,
    TResult Function(AddToStory value)? addToStory,
    TResult Function(FetchArchivedStroies value)? fetchArchivedStroies,
    required TResult orElse(),
  }) {
    if (selectImageFromGallery != null) {
      return selectImageFromGallery(this);
    }
    return orElse();
  }
}

abstract class SelectImageFromGallery implements StoryEvent {
  const factory SelectImageFromGallery() = _$SelectImageFromGalleryImpl;
}

/// @nodoc
abstract class _$$TakeImageWithCameraImplCopyWith<$Res> {
  factory _$$TakeImageWithCameraImplCopyWith(_$TakeImageWithCameraImpl value,
          $Res Function(_$TakeImageWithCameraImpl) then) =
      __$$TakeImageWithCameraImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TakeImageWithCameraImplCopyWithImpl<$Res>
    extends _$StoryEventCopyWithImpl<$Res, _$TakeImageWithCameraImpl>
    implements _$$TakeImageWithCameraImplCopyWith<$Res> {
  __$$TakeImageWithCameraImplCopyWithImpl(_$TakeImageWithCameraImpl _value,
      $Res Function(_$TakeImageWithCameraImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TakeImageWithCameraImpl
    with DiagnosticableTreeMixin
    implements TakeImageWithCamera {
  const _$TakeImageWithCameraImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryEvent.takeImageWithCamera()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'StoryEvent.takeImageWithCamera'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TakeImageWithCameraImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentImages,
    required TResult Function() selectImageFromGallery,
    required TResult Function() takeImageWithCamera,
    required TResult Function(Story story) addToStory,
    required TResult Function() fetchArchivedStroies,
  }) {
    return takeImageWithCamera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentImages,
    TResult? Function()? selectImageFromGallery,
    TResult? Function()? takeImageWithCamera,
    TResult? Function(Story story)? addToStory,
    TResult? Function()? fetchArchivedStroies,
  }) {
    return takeImageWithCamera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentImages,
    TResult Function()? selectImageFromGallery,
    TResult Function()? takeImageWithCamera,
    TResult Function(Story story)? addToStory,
    TResult Function()? fetchArchivedStroies,
    required TResult orElse(),
  }) {
    if (takeImageWithCamera != null) {
      return takeImageWithCamera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentImages value) fetchRecentImages,
    required TResult Function(SelectImageFromGallery value)
        selectImageFromGallery,
    required TResult Function(TakeImageWithCamera value) takeImageWithCamera,
    required TResult Function(AddToStory value) addToStory,
    required TResult Function(FetchArchivedStroies value) fetchArchivedStroies,
  }) {
    return takeImageWithCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentImages value)? fetchRecentImages,
    TResult? Function(SelectImageFromGallery value)? selectImageFromGallery,
    TResult? Function(TakeImageWithCamera value)? takeImageWithCamera,
    TResult? Function(AddToStory value)? addToStory,
    TResult? Function(FetchArchivedStroies value)? fetchArchivedStroies,
  }) {
    return takeImageWithCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentImages value)? fetchRecentImages,
    TResult Function(SelectImageFromGallery value)? selectImageFromGallery,
    TResult Function(TakeImageWithCamera value)? takeImageWithCamera,
    TResult Function(AddToStory value)? addToStory,
    TResult Function(FetchArchivedStroies value)? fetchArchivedStroies,
    required TResult orElse(),
  }) {
    if (takeImageWithCamera != null) {
      return takeImageWithCamera(this);
    }
    return orElse();
  }
}

abstract class TakeImageWithCamera implements StoryEvent {
  const factory TakeImageWithCamera() = _$TakeImageWithCameraImpl;
}

/// @nodoc
abstract class _$$AddToStoryImplCopyWith<$Res> {
  factory _$$AddToStoryImplCopyWith(
          _$AddToStoryImpl value, $Res Function(_$AddToStoryImpl) then) =
      __$$AddToStoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Story story});
}

/// @nodoc
class __$$AddToStoryImplCopyWithImpl<$Res>
    extends _$StoryEventCopyWithImpl<$Res, _$AddToStoryImpl>
    implements _$$AddToStoryImplCopyWith<$Res> {
  __$$AddToStoryImplCopyWithImpl(
      _$AddToStoryImpl _value, $Res Function(_$AddToStoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? story = null,
  }) {
    return _then(_$AddToStoryImpl(
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as Story,
    ));
  }
}

/// @nodoc

class _$AddToStoryImpl with DiagnosticableTreeMixin implements AddToStory {
  const _$AddToStoryImpl({required this.story});

  @override
  final Story story;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryEvent.addToStory(story: $story)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StoryEvent.addToStory'))
      ..add(DiagnosticsProperty('story', story));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToStoryImpl &&
            (identical(other.story, story) || other.story == story));
  }

  @override
  int get hashCode => Object.hash(runtimeType, story);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToStoryImplCopyWith<_$AddToStoryImpl> get copyWith =>
      __$$AddToStoryImplCopyWithImpl<_$AddToStoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentImages,
    required TResult Function() selectImageFromGallery,
    required TResult Function() takeImageWithCamera,
    required TResult Function(Story story) addToStory,
    required TResult Function() fetchArchivedStroies,
  }) {
    return addToStory(story);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentImages,
    TResult? Function()? selectImageFromGallery,
    TResult? Function()? takeImageWithCamera,
    TResult? Function(Story story)? addToStory,
    TResult? Function()? fetchArchivedStroies,
  }) {
    return addToStory?.call(story);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentImages,
    TResult Function()? selectImageFromGallery,
    TResult Function()? takeImageWithCamera,
    TResult Function(Story story)? addToStory,
    TResult Function()? fetchArchivedStroies,
    required TResult orElse(),
  }) {
    if (addToStory != null) {
      return addToStory(story);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentImages value) fetchRecentImages,
    required TResult Function(SelectImageFromGallery value)
        selectImageFromGallery,
    required TResult Function(TakeImageWithCamera value) takeImageWithCamera,
    required TResult Function(AddToStory value) addToStory,
    required TResult Function(FetchArchivedStroies value) fetchArchivedStroies,
  }) {
    return addToStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentImages value)? fetchRecentImages,
    TResult? Function(SelectImageFromGallery value)? selectImageFromGallery,
    TResult? Function(TakeImageWithCamera value)? takeImageWithCamera,
    TResult? Function(AddToStory value)? addToStory,
    TResult? Function(FetchArchivedStroies value)? fetchArchivedStroies,
  }) {
    return addToStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentImages value)? fetchRecentImages,
    TResult Function(SelectImageFromGallery value)? selectImageFromGallery,
    TResult Function(TakeImageWithCamera value)? takeImageWithCamera,
    TResult Function(AddToStory value)? addToStory,
    TResult Function(FetchArchivedStroies value)? fetchArchivedStroies,
    required TResult orElse(),
  }) {
    if (addToStory != null) {
      return addToStory(this);
    }
    return orElse();
  }
}

abstract class AddToStory implements StoryEvent {
  const factory AddToStory({required final Story story}) = _$AddToStoryImpl;

  Story get story;
  @JsonKey(ignore: true)
  _$$AddToStoryImplCopyWith<_$AddToStoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchArchivedStroiesImplCopyWith<$Res> {
  factory _$$FetchArchivedStroiesImplCopyWith(_$FetchArchivedStroiesImpl value,
          $Res Function(_$FetchArchivedStroiesImpl) then) =
      __$$FetchArchivedStroiesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchArchivedStroiesImplCopyWithImpl<$Res>
    extends _$StoryEventCopyWithImpl<$Res, _$FetchArchivedStroiesImpl>
    implements _$$FetchArchivedStroiesImplCopyWith<$Res> {
  __$$FetchArchivedStroiesImplCopyWithImpl(_$FetchArchivedStroiesImpl _value,
      $Res Function(_$FetchArchivedStroiesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchArchivedStroiesImpl
    with DiagnosticableTreeMixin
    implements FetchArchivedStroies {
  const _$FetchArchivedStroiesImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryEvent.fetchArchivedStroies()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'StoryEvent.fetchArchivedStroies'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchArchivedStroiesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRecentImages,
    required TResult Function() selectImageFromGallery,
    required TResult Function() takeImageWithCamera,
    required TResult Function(Story story) addToStory,
    required TResult Function() fetchArchivedStroies,
  }) {
    return fetchArchivedStroies();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRecentImages,
    TResult? Function()? selectImageFromGallery,
    TResult? Function()? takeImageWithCamera,
    TResult? Function(Story story)? addToStory,
    TResult? Function()? fetchArchivedStroies,
  }) {
    return fetchArchivedStroies?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRecentImages,
    TResult Function()? selectImageFromGallery,
    TResult Function()? takeImageWithCamera,
    TResult Function(Story story)? addToStory,
    TResult Function()? fetchArchivedStroies,
    required TResult orElse(),
  }) {
    if (fetchArchivedStroies != null) {
      return fetchArchivedStroies();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchRecentImages value) fetchRecentImages,
    required TResult Function(SelectImageFromGallery value)
        selectImageFromGallery,
    required TResult Function(TakeImageWithCamera value) takeImageWithCamera,
    required TResult Function(AddToStory value) addToStory,
    required TResult Function(FetchArchivedStroies value) fetchArchivedStroies,
  }) {
    return fetchArchivedStroies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchRecentImages value)? fetchRecentImages,
    TResult? Function(SelectImageFromGallery value)? selectImageFromGallery,
    TResult? Function(TakeImageWithCamera value)? takeImageWithCamera,
    TResult? Function(AddToStory value)? addToStory,
    TResult? Function(FetchArchivedStroies value)? fetchArchivedStroies,
  }) {
    return fetchArchivedStroies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchRecentImages value)? fetchRecentImages,
    TResult Function(SelectImageFromGallery value)? selectImageFromGallery,
    TResult Function(TakeImageWithCamera value)? takeImageWithCamera,
    TResult Function(AddToStory value)? addToStory,
    TResult Function(FetchArchivedStroies value)? fetchArchivedStroies,
    required TResult orElse(),
  }) {
    if (fetchArchivedStroies != null) {
      return fetchArchivedStroies(this);
    }
    return orElse();
  }
}

abstract class FetchArchivedStroies implements StoryEvent {
  const factory FetchArchivedStroies() = _$FetchArchivedStroiesImpl;
}

/// @nodoc
mixin _$StoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<File?> recentImages)
        recentImagesFetchedSuccess,
    required TResult Function(File selectedImage, bool isCamera) imageSelected,
    required TResult Function() storyAddedSuccesfully,
    required TResult Function() loading,
    required TResult Function(List<Story> stories)
        fetchedArchivedStroiesSuccess,
    required TResult Function(String error) fetchedArchivedStroiesError,
    required TResult Function() fetchedArchivedStroiesIsEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult? Function(File selectedImage, bool isCamera)? imageSelected,
    TResult? Function()? storyAddedSuccesfully,
    TResult? Function()? loading,
    TResult? Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult? Function(String error)? fetchedArchivedStroiesError,
    TResult? Function()? fetchedArchivedStroiesIsEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult Function(File selectedImage, bool isCamera)? imageSelected,
    TResult Function()? storyAddedSuccesfully,
    TResult Function()? loading,
    TResult Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult Function(String error)? fetchedArchivedStroiesError,
    TResult Function()? fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RecentImagesFetchedSuccess value)
        recentImagesFetchedSuccess,
    required TResult Function(ImageSelected value) imageSelected,
    required TResult Function(StoryAddedSuccesfully value)
        storyAddedSuccesfully,
    required TResult Function(Loading value) loading,
    required TResult Function(FetchedArchivedStroiesSuccess value)
        fetchedArchivedStroiesSuccess,
    required TResult Function(FetchedArchivedStroiesError value)
        fetchedArchivedStroiesError,
    required TResult Function(FetchedArchivedStroiesIsEmpty value)
        fetchedArchivedStroiesIsEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult? Function(ImageSelected value)? imageSelected,
    TResult? Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult? Function(Loading value)? loading,
    TResult? Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult? Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult? Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult Function(ImageSelected value)? imageSelected,
    TResult Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult Function(Loading value)? loading,
    TResult Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryStateCopyWith<$Res> {
  factory $StoryStateCopyWith(
          StoryState value, $Res Function(StoryState) then) =
      _$StoryStateCopyWithImpl<$Res, StoryState>;
}

/// @nodoc
class _$StoryStateCopyWithImpl<$Res, $Val extends StoryState>
    implements $StoryStateCopyWith<$Res> {
  _$StoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'StoryState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<File?> recentImages)
        recentImagesFetchedSuccess,
    required TResult Function(File selectedImage, bool isCamera) imageSelected,
    required TResult Function() storyAddedSuccesfully,
    required TResult Function() loading,
    required TResult Function(List<Story> stories)
        fetchedArchivedStroiesSuccess,
    required TResult Function(String error) fetchedArchivedStroiesError,
    required TResult Function() fetchedArchivedStroiesIsEmpty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult? Function(File selectedImage, bool isCamera)? imageSelected,
    TResult? Function()? storyAddedSuccesfully,
    TResult? Function()? loading,
    TResult? Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult? Function(String error)? fetchedArchivedStroiesError,
    TResult? Function()? fetchedArchivedStroiesIsEmpty,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult Function(File selectedImage, bool isCamera)? imageSelected,
    TResult Function()? storyAddedSuccesfully,
    TResult Function()? loading,
    TResult Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult Function(String error)? fetchedArchivedStroiesError,
    TResult Function()? fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RecentImagesFetchedSuccess value)
        recentImagesFetchedSuccess,
    required TResult Function(ImageSelected value) imageSelected,
    required TResult Function(StoryAddedSuccesfully value)
        storyAddedSuccesfully,
    required TResult Function(Loading value) loading,
    required TResult Function(FetchedArchivedStroiesSuccess value)
        fetchedArchivedStroiesSuccess,
    required TResult Function(FetchedArchivedStroiesError value)
        fetchedArchivedStroiesError,
    required TResult Function(FetchedArchivedStroiesIsEmpty value)
        fetchedArchivedStroiesIsEmpty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult? Function(ImageSelected value)? imageSelected,
    TResult? Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult? Function(Loading value)? loading,
    TResult? Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult? Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult? Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult Function(ImageSelected value)? imageSelected,
    TResult Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult Function(Loading value)? loading,
    TResult Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements StoryState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$RecentImagesFetchedSuccessImplCopyWith<$Res> {
  factory _$$RecentImagesFetchedSuccessImplCopyWith(
          _$RecentImagesFetchedSuccessImpl value,
          $Res Function(_$RecentImagesFetchedSuccessImpl) then) =
      __$$RecentImagesFetchedSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<File?> recentImages});
}

/// @nodoc
class __$$RecentImagesFetchedSuccessImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$RecentImagesFetchedSuccessImpl>
    implements _$$RecentImagesFetchedSuccessImplCopyWith<$Res> {
  __$$RecentImagesFetchedSuccessImplCopyWithImpl(
      _$RecentImagesFetchedSuccessImpl _value,
      $Res Function(_$RecentImagesFetchedSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentImages = null,
  }) {
    return _then(_$RecentImagesFetchedSuccessImpl(
      recentImages: null == recentImages
          ? _value._recentImages
          : recentImages // ignore: cast_nullable_to_non_nullable
              as List<File?>,
    ));
  }
}

/// @nodoc

class _$RecentImagesFetchedSuccessImpl
    with DiagnosticableTreeMixin
    implements RecentImagesFetchedSuccess {
  const _$RecentImagesFetchedSuccessImpl(
      {required final List<File?> recentImages})
      : _recentImages = recentImages;

  final List<File?> _recentImages;
  @override
  List<File?> get recentImages {
    if (_recentImages is EqualUnmodifiableListView) return _recentImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentImages);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryState.recentImagesFetchedSuccess(recentImages: $recentImages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'StoryState.recentImagesFetchedSuccess'))
      ..add(DiagnosticsProperty('recentImages', recentImages));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentImagesFetchedSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._recentImages, _recentImages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_recentImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentImagesFetchedSuccessImplCopyWith<_$RecentImagesFetchedSuccessImpl>
      get copyWith => __$$RecentImagesFetchedSuccessImplCopyWithImpl<
          _$RecentImagesFetchedSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<File?> recentImages)
        recentImagesFetchedSuccess,
    required TResult Function(File selectedImage, bool isCamera) imageSelected,
    required TResult Function() storyAddedSuccesfully,
    required TResult Function() loading,
    required TResult Function(List<Story> stories)
        fetchedArchivedStroiesSuccess,
    required TResult Function(String error) fetchedArchivedStroiesError,
    required TResult Function() fetchedArchivedStroiesIsEmpty,
  }) {
    return recentImagesFetchedSuccess(recentImages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult? Function(File selectedImage, bool isCamera)? imageSelected,
    TResult? Function()? storyAddedSuccesfully,
    TResult? Function()? loading,
    TResult? Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult? Function(String error)? fetchedArchivedStroiesError,
    TResult? Function()? fetchedArchivedStroiesIsEmpty,
  }) {
    return recentImagesFetchedSuccess?.call(recentImages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult Function(File selectedImage, bool isCamera)? imageSelected,
    TResult Function()? storyAddedSuccesfully,
    TResult Function()? loading,
    TResult Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult Function(String error)? fetchedArchivedStroiesError,
    TResult Function()? fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (recentImagesFetchedSuccess != null) {
      return recentImagesFetchedSuccess(recentImages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RecentImagesFetchedSuccess value)
        recentImagesFetchedSuccess,
    required TResult Function(ImageSelected value) imageSelected,
    required TResult Function(StoryAddedSuccesfully value)
        storyAddedSuccesfully,
    required TResult Function(Loading value) loading,
    required TResult Function(FetchedArchivedStroiesSuccess value)
        fetchedArchivedStroiesSuccess,
    required TResult Function(FetchedArchivedStroiesError value)
        fetchedArchivedStroiesError,
    required TResult Function(FetchedArchivedStroiesIsEmpty value)
        fetchedArchivedStroiesIsEmpty,
  }) {
    return recentImagesFetchedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult? Function(ImageSelected value)? imageSelected,
    TResult? Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult? Function(Loading value)? loading,
    TResult? Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult? Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult? Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
  }) {
    return recentImagesFetchedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult Function(ImageSelected value)? imageSelected,
    TResult Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult Function(Loading value)? loading,
    TResult Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (recentImagesFetchedSuccess != null) {
      return recentImagesFetchedSuccess(this);
    }
    return orElse();
  }
}

abstract class RecentImagesFetchedSuccess implements StoryState {
  const factory RecentImagesFetchedSuccess(
          {required final List<File?> recentImages}) =
      _$RecentImagesFetchedSuccessImpl;

  List<File?> get recentImages;
  @JsonKey(ignore: true)
  _$$RecentImagesFetchedSuccessImplCopyWith<_$RecentImagesFetchedSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageSelectedImplCopyWith<$Res> {
  factory _$$ImageSelectedImplCopyWith(
          _$ImageSelectedImpl value, $Res Function(_$ImageSelectedImpl) then) =
      __$$ImageSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File selectedImage, bool isCamera});
}

/// @nodoc
class __$$ImageSelectedImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$ImageSelectedImpl>
    implements _$$ImageSelectedImplCopyWith<$Res> {
  __$$ImageSelectedImplCopyWithImpl(
      _$ImageSelectedImpl _value, $Res Function(_$ImageSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedImage = null,
    Object? isCamera = null,
  }) {
    return _then(_$ImageSelectedImpl(
      selectedImage: null == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as File,
      isCamera: null == isCamera
          ? _value.isCamera
          : isCamera // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ImageSelectedImpl
    with DiagnosticableTreeMixin
    implements ImageSelected {
  const _$ImageSelectedImpl(
      {required this.selectedImage, required this.isCamera});

  @override
  final File selectedImage;
  @override
  final bool isCamera;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryState.imageSelected(selectedImage: $selectedImage, isCamera: $isCamera)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StoryState.imageSelected'))
      ..add(DiagnosticsProperty('selectedImage', selectedImage))
      ..add(DiagnosticsProperty('isCamera', isCamera));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageSelectedImpl &&
            (identical(other.selectedImage, selectedImage) ||
                other.selectedImage == selectedImage) &&
            (identical(other.isCamera, isCamera) ||
                other.isCamera == isCamera));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedImage, isCamera);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageSelectedImplCopyWith<_$ImageSelectedImpl> get copyWith =>
      __$$ImageSelectedImplCopyWithImpl<_$ImageSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<File?> recentImages)
        recentImagesFetchedSuccess,
    required TResult Function(File selectedImage, bool isCamera) imageSelected,
    required TResult Function() storyAddedSuccesfully,
    required TResult Function() loading,
    required TResult Function(List<Story> stories)
        fetchedArchivedStroiesSuccess,
    required TResult Function(String error) fetchedArchivedStroiesError,
    required TResult Function() fetchedArchivedStroiesIsEmpty,
  }) {
    return imageSelected(selectedImage, isCamera);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult? Function(File selectedImage, bool isCamera)? imageSelected,
    TResult? Function()? storyAddedSuccesfully,
    TResult? Function()? loading,
    TResult? Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult? Function(String error)? fetchedArchivedStroiesError,
    TResult? Function()? fetchedArchivedStroiesIsEmpty,
  }) {
    return imageSelected?.call(selectedImage, isCamera);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult Function(File selectedImage, bool isCamera)? imageSelected,
    TResult Function()? storyAddedSuccesfully,
    TResult Function()? loading,
    TResult Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult Function(String error)? fetchedArchivedStroiesError,
    TResult Function()? fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (imageSelected != null) {
      return imageSelected(selectedImage, isCamera);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RecentImagesFetchedSuccess value)
        recentImagesFetchedSuccess,
    required TResult Function(ImageSelected value) imageSelected,
    required TResult Function(StoryAddedSuccesfully value)
        storyAddedSuccesfully,
    required TResult Function(Loading value) loading,
    required TResult Function(FetchedArchivedStroiesSuccess value)
        fetchedArchivedStroiesSuccess,
    required TResult Function(FetchedArchivedStroiesError value)
        fetchedArchivedStroiesError,
    required TResult Function(FetchedArchivedStroiesIsEmpty value)
        fetchedArchivedStroiesIsEmpty,
  }) {
    return imageSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult? Function(ImageSelected value)? imageSelected,
    TResult? Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult? Function(Loading value)? loading,
    TResult? Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult? Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult? Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
  }) {
    return imageSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult Function(ImageSelected value)? imageSelected,
    TResult Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult Function(Loading value)? loading,
    TResult Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (imageSelected != null) {
      return imageSelected(this);
    }
    return orElse();
  }
}

abstract class ImageSelected implements StoryState {
  const factory ImageSelected(
      {required final File selectedImage,
      required final bool isCamera}) = _$ImageSelectedImpl;

  File get selectedImage;
  bool get isCamera;
  @JsonKey(ignore: true)
  _$$ImageSelectedImplCopyWith<_$ImageSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoryAddedSuccesfullyImplCopyWith<$Res> {
  factory _$$StoryAddedSuccesfullyImplCopyWith(
          _$StoryAddedSuccesfullyImpl value,
          $Res Function(_$StoryAddedSuccesfullyImpl) then) =
      __$$StoryAddedSuccesfullyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoryAddedSuccesfullyImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$StoryAddedSuccesfullyImpl>
    implements _$$StoryAddedSuccesfullyImplCopyWith<$Res> {
  __$$StoryAddedSuccesfullyImplCopyWithImpl(_$StoryAddedSuccesfullyImpl _value,
      $Res Function(_$StoryAddedSuccesfullyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StoryAddedSuccesfullyImpl
    with DiagnosticableTreeMixin
    implements StoryAddedSuccesfully {
  const _$StoryAddedSuccesfullyImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryState.storyAddedSuccesfully()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'StoryState.storyAddedSuccesfully'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryAddedSuccesfullyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<File?> recentImages)
        recentImagesFetchedSuccess,
    required TResult Function(File selectedImage, bool isCamera) imageSelected,
    required TResult Function() storyAddedSuccesfully,
    required TResult Function() loading,
    required TResult Function(List<Story> stories)
        fetchedArchivedStroiesSuccess,
    required TResult Function(String error) fetchedArchivedStroiesError,
    required TResult Function() fetchedArchivedStroiesIsEmpty,
  }) {
    return storyAddedSuccesfully();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult? Function(File selectedImage, bool isCamera)? imageSelected,
    TResult? Function()? storyAddedSuccesfully,
    TResult? Function()? loading,
    TResult? Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult? Function(String error)? fetchedArchivedStroiesError,
    TResult? Function()? fetchedArchivedStroiesIsEmpty,
  }) {
    return storyAddedSuccesfully?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult Function(File selectedImage, bool isCamera)? imageSelected,
    TResult Function()? storyAddedSuccesfully,
    TResult Function()? loading,
    TResult Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult Function(String error)? fetchedArchivedStroiesError,
    TResult Function()? fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (storyAddedSuccesfully != null) {
      return storyAddedSuccesfully();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RecentImagesFetchedSuccess value)
        recentImagesFetchedSuccess,
    required TResult Function(ImageSelected value) imageSelected,
    required TResult Function(StoryAddedSuccesfully value)
        storyAddedSuccesfully,
    required TResult Function(Loading value) loading,
    required TResult Function(FetchedArchivedStroiesSuccess value)
        fetchedArchivedStroiesSuccess,
    required TResult Function(FetchedArchivedStroiesError value)
        fetchedArchivedStroiesError,
    required TResult Function(FetchedArchivedStroiesIsEmpty value)
        fetchedArchivedStroiesIsEmpty,
  }) {
    return storyAddedSuccesfully(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult? Function(ImageSelected value)? imageSelected,
    TResult? Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult? Function(Loading value)? loading,
    TResult? Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult? Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult? Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
  }) {
    return storyAddedSuccesfully?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult Function(ImageSelected value)? imageSelected,
    TResult Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult Function(Loading value)? loading,
    TResult Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (storyAddedSuccesfully != null) {
      return storyAddedSuccesfully(this);
    }
    return orElse();
  }
}

abstract class StoryAddedSuccesfully implements StoryState {
  const factory StoryAddedSuccesfully() = _$StoryAddedSuccesfullyImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'StoryState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<File?> recentImages)
        recentImagesFetchedSuccess,
    required TResult Function(File selectedImage, bool isCamera) imageSelected,
    required TResult Function() storyAddedSuccesfully,
    required TResult Function() loading,
    required TResult Function(List<Story> stories)
        fetchedArchivedStroiesSuccess,
    required TResult Function(String error) fetchedArchivedStroiesError,
    required TResult Function() fetchedArchivedStroiesIsEmpty,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult? Function(File selectedImage, bool isCamera)? imageSelected,
    TResult? Function()? storyAddedSuccesfully,
    TResult? Function()? loading,
    TResult? Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult? Function(String error)? fetchedArchivedStroiesError,
    TResult? Function()? fetchedArchivedStroiesIsEmpty,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult Function(File selectedImage, bool isCamera)? imageSelected,
    TResult Function()? storyAddedSuccesfully,
    TResult Function()? loading,
    TResult Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult Function(String error)? fetchedArchivedStroiesError,
    TResult Function()? fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RecentImagesFetchedSuccess value)
        recentImagesFetchedSuccess,
    required TResult Function(ImageSelected value) imageSelected,
    required TResult Function(StoryAddedSuccesfully value)
        storyAddedSuccesfully,
    required TResult Function(Loading value) loading,
    required TResult Function(FetchedArchivedStroiesSuccess value)
        fetchedArchivedStroiesSuccess,
    required TResult Function(FetchedArchivedStroiesError value)
        fetchedArchivedStroiesError,
    required TResult Function(FetchedArchivedStroiesIsEmpty value)
        fetchedArchivedStroiesIsEmpty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult? Function(ImageSelected value)? imageSelected,
    TResult? Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult? Function(Loading value)? loading,
    TResult? Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult? Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult? Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult Function(ImageSelected value)? imageSelected,
    TResult Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult Function(Loading value)? loading,
    TResult Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements StoryState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FetchedArchivedStroiesSuccessImplCopyWith<$Res> {
  factory _$$FetchedArchivedStroiesSuccessImplCopyWith(
          _$FetchedArchivedStroiesSuccessImpl value,
          $Res Function(_$FetchedArchivedStroiesSuccessImpl) then) =
      __$$FetchedArchivedStroiesSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Story> stories});
}

/// @nodoc
class __$$FetchedArchivedStroiesSuccessImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$FetchedArchivedStroiesSuccessImpl>
    implements _$$FetchedArchivedStroiesSuccessImplCopyWith<$Res> {
  __$$FetchedArchivedStroiesSuccessImplCopyWithImpl(
      _$FetchedArchivedStroiesSuccessImpl _value,
      $Res Function(_$FetchedArchivedStroiesSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stories = null,
  }) {
    return _then(_$FetchedArchivedStroiesSuccessImpl(
      stories: null == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<Story>,
    ));
  }
}

/// @nodoc

class _$FetchedArchivedStroiesSuccessImpl
    with DiagnosticableTreeMixin
    implements FetchedArchivedStroiesSuccess {
  const _$FetchedArchivedStroiesSuccessImpl(
      {required final List<Story> stories})
      : _stories = stories;

  final List<Story> _stories;
  @override
  List<Story> get stories {
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stories);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryState.fetchedArchivedStroiesSuccess(stories: $stories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'StoryState.fetchedArchivedStroiesSuccess'))
      ..add(DiagnosticsProperty('stories', stories));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchedArchivedStroiesSuccessImpl &&
            const DeepCollectionEquality().equals(other._stories, _stories));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_stories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchedArchivedStroiesSuccessImplCopyWith<
          _$FetchedArchivedStroiesSuccessImpl>
      get copyWith => __$$FetchedArchivedStroiesSuccessImplCopyWithImpl<
          _$FetchedArchivedStroiesSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<File?> recentImages)
        recentImagesFetchedSuccess,
    required TResult Function(File selectedImage, bool isCamera) imageSelected,
    required TResult Function() storyAddedSuccesfully,
    required TResult Function() loading,
    required TResult Function(List<Story> stories)
        fetchedArchivedStroiesSuccess,
    required TResult Function(String error) fetchedArchivedStroiesError,
    required TResult Function() fetchedArchivedStroiesIsEmpty,
  }) {
    return fetchedArchivedStroiesSuccess(stories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult? Function(File selectedImage, bool isCamera)? imageSelected,
    TResult? Function()? storyAddedSuccesfully,
    TResult? Function()? loading,
    TResult? Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult? Function(String error)? fetchedArchivedStroiesError,
    TResult? Function()? fetchedArchivedStroiesIsEmpty,
  }) {
    return fetchedArchivedStroiesSuccess?.call(stories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult Function(File selectedImage, bool isCamera)? imageSelected,
    TResult Function()? storyAddedSuccesfully,
    TResult Function()? loading,
    TResult Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult Function(String error)? fetchedArchivedStroiesError,
    TResult Function()? fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (fetchedArchivedStroiesSuccess != null) {
      return fetchedArchivedStroiesSuccess(stories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RecentImagesFetchedSuccess value)
        recentImagesFetchedSuccess,
    required TResult Function(ImageSelected value) imageSelected,
    required TResult Function(StoryAddedSuccesfully value)
        storyAddedSuccesfully,
    required TResult Function(Loading value) loading,
    required TResult Function(FetchedArchivedStroiesSuccess value)
        fetchedArchivedStroiesSuccess,
    required TResult Function(FetchedArchivedStroiesError value)
        fetchedArchivedStroiesError,
    required TResult Function(FetchedArchivedStroiesIsEmpty value)
        fetchedArchivedStroiesIsEmpty,
  }) {
    return fetchedArchivedStroiesSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult? Function(ImageSelected value)? imageSelected,
    TResult? Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult? Function(Loading value)? loading,
    TResult? Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult? Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult? Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
  }) {
    return fetchedArchivedStroiesSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult Function(ImageSelected value)? imageSelected,
    TResult Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult Function(Loading value)? loading,
    TResult Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (fetchedArchivedStroiesSuccess != null) {
      return fetchedArchivedStroiesSuccess(this);
    }
    return orElse();
  }
}

abstract class FetchedArchivedStroiesSuccess implements StoryState {
  const factory FetchedArchivedStroiesSuccess(
          {required final List<Story> stories}) =
      _$FetchedArchivedStroiesSuccessImpl;

  List<Story> get stories;
  @JsonKey(ignore: true)
  _$$FetchedArchivedStroiesSuccessImplCopyWith<
          _$FetchedArchivedStroiesSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchedArchivedStroiesErrorImplCopyWith<$Res> {
  factory _$$FetchedArchivedStroiesErrorImplCopyWith(
          _$FetchedArchivedStroiesErrorImpl value,
          $Res Function(_$FetchedArchivedStroiesErrorImpl) then) =
      __$$FetchedArchivedStroiesErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FetchedArchivedStroiesErrorImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$FetchedArchivedStroiesErrorImpl>
    implements _$$FetchedArchivedStroiesErrorImplCopyWith<$Res> {
  __$$FetchedArchivedStroiesErrorImplCopyWithImpl(
      _$FetchedArchivedStroiesErrorImpl _value,
      $Res Function(_$FetchedArchivedStroiesErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FetchedArchivedStroiesErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchedArchivedStroiesErrorImpl
    with DiagnosticableTreeMixin
    implements FetchedArchivedStroiesError {
  const _$FetchedArchivedStroiesErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryState.fetchedArchivedStroiesError(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'StoryState.fetchedArchivedStroiesError'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchedArchivedStroiesErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchedArchivedStroiesErrorImplCopyWith<_$FetchedArchivedStroiesErrorImpl>
      get copyWith => __$$FetchedArchivedStroiesErrorImplCopyWithImpl<
          _$FetchedArchivedStroiesErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<File?> recentImages)
        recentImagesFetchedSuccess,
    required TResult Function(File selectedImage, bool isCamera) imageSelected,
    required TResult Function() storyAddedSuccesfully,
    required TResult Function() loading,
    required TResult Function(List<Story> stories)
        fetchedArchivedStroiesSuccess,
    required TResult Function(String error) fetchedArchivedStroiesError,
    required TResult Function() fetchedArchivedStroiesIsEmpty,
  }) {
    return fetchedArchivedStroiesError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult? Function(File selectedImage, bool isCamera)? imageSelected,
    TResult? Function()? storyAddedSuccesfully,
    TResult? Function()? loading,
    TResult? Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult? Function(String error)? fetchedArchivedStroiesError,
    TResult? Function()? fetchedArchivedStroiesIsEmpty,
  }) {
    return fetchedArchivedStroiesError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult Function(File selectedImage, bool isCamera)? imageSelected,
    TResult Function()? storyAddedSuccesfully,
    TResult Function()? loading,
    TResult Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult Function(String error)? fetchedArchivedStroiesError,
    TResult Function()? fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (fetchedArchivedStroiesError != null) {
      return fetchedArchivedStroiesError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RecentImagesFetchedSuccess value)
        recentImagesFetchedSuccess,
    required TResult Function(ImageSelected value) imageSelected,
    required TResult Function(StoryAddedSuccesfully value)
        storyAddedSuccesfully,
    required TResult Function(Loading value) loading,
    required TResult Function(FetchedArchivedStroiesSuccess value)
        fetchedArchivedStroiesSuccess,
    required TResult Function(FetchedArchivedStroiesError value)
        fetchedArchivedStroiesError,
    required TResult Function(FetchedArchivedStroiesIsEmpty value)
        fetchedArchivedStroiesIsEmpty,
  }) {
    return fetchedArchivedStroiesError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult? Function(ImageSelected value)? imageSelected,
    TResult? Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult? Function(Loading value)? loading,
    TResult? Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult? Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult? Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
  }) {
    return fetchedArchivedStroiesError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult Function(ImageSelected value)? imageSelected,
    TResult Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult Function(Loading value)? loading,
    TResult Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (fetchedArchivedStroiesError != null) {
      return fetchedArchivedStroiesError(this);
    }
    return orElse();
  }
}

abstract class FetchedArchivedStroiesError implements StoryState {
  const factory FetchedArchivedStroiesError({required final String error}) =
      _$FetchedArchivedStroiesErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$FetchedArchivedStroiesErrorImplCopyWith<_$FetchedArchivedStroiesErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchedArchivedStroiesIsEmptyImplCopyWith<$Res> {
  factory _$$FetchedArchivedStroiesIsEmptyImplCopyWith(
          _$FetchedArchivedStroiesIsEmptyImpl value,
          $Res Function(_$FetchedArchivedStroiesIsEmptyImpl) then) =
      __$$FetchedArchivedStroiesIsEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchedArchivedStroiesIsEmptyImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$FetchedArchivedStroiesIsEmptyImpl>
    implements _$$FetchedArchivedStroiesIsEmptyImplCopyWith<$Res> {
  __$$FetchedArchivedStroiesIsEmptyImplCopyWithImpl(
      _$FetchedArchivedStroiesIsEmptyImpl _value,
      $Res Function(_$FetchedArchivedStroiesIsEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchedArchivedStroiesIsEmptyImpl
    with DiagnosticableTreeMixin
    implements FetchedArchivedStroiesIsEmpty {
  const _$FetchedArchivedStroiesIsEmptyImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryState.fetchedArchivedStroiesIsEmpty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty(
        'type', 'StoryState.fetchedArchivedStroiesIsEmpty'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchedArchivedStroiesIsEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<File?> recentImages)
        recentImagesFetchedSuccess,
    required TResult Function(File selectedImage, bool isCamera) imageSelected,
    required TResult Function() storyAddedSuccesfully,
    required TResult Function() loading,
    required TResult Function(List<Story> stories)
        fetchedArchivedStroiesSuccess,
    required TResult Function(String error) fetchedArchivedStroiesError,
    required TResult Function() fetchedArchivedStroiesIsEmpty,
  }) {
    return fetchedArchivedStroiesIsEmpty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult? Function(File selectedImage, bool isCamera)? imageSelected,
    TResult? Function()? storyAddedSuccesfully,
    TResult? Function()? loading,
    TResult? Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult? Function(String error)? fetchedArchivedStroiesError,
    TResult? Function()? fetchedArchivedStroiesIsEmpty,
  }) {
    return fetchedArchivedStroiesIsEmpty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<File?> recentImages)? recentImagesFetchedSuccess,
    TResult Function(File selectedImage, bool isCamera)? imageSelected,
    TResult Function()? storyAddedSuccesfully,
    TResult Function()? loading,
    TResult Function(List<Story> stories)? fetchedArchivedStroiesSuccess,
    TResult Function(String error)? fetchedArchivedStroiesError,
    TResult Function()? fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (fetchedArchivedStroiesIsEmpty != null) {
      return fetchedArchivedStroiesIsEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RecentImagesFetchedSuccess value)
        recentImagesFetchedSuccess,
    required TResult Function(ImageSelected value) imageSelected,
    required TResult Function(StoryAddedSuccesfully value)
        storyAddedSuccesfully,
    required TResult Function(Loading value) loading,
    required TResult Function(FetchedArchivedStroiesSuccess value)
        fetchedArchivedStroiesSuccess,
    required TResult Function(FetchedArchivedStroiesError value)
        fetchedArchivedStroiesError,
    required TResult Function(FetchedArchivedStroiesIsEmpty value)
        fetchedArchivedStroiesIsEmpty,
  }) {
    return fetchedArchivedStroiesIsEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult? Function(ImageSelected value)? imageSelected,
    TResult? Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult? Function(Loading value)? loading,
    TResult? Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult? Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult? Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
  }) {
    return fetchedArchivedStroiesIsEmpty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RecentImagesFetchedSuccess value)?
        recentImagesFetchedSuccess,
    TResult Function(ImageSelected value)? imageSelected,
    TResult Function(StoryAddedSuccesfully value)? storyAddedSuccesfully,
    TResult Function(Loading value)? loading,
    TResult Function(FetchedArchivedStroiesSuccess value)?
        fetchedArchivedStroiesSuccess,
    TResult Function(FetchedArchivedStroiesError value)?
        fetchedArchivedStroiesError,
    TResult Function(FetchedArchivedStroiesIsEmpty value)?
        fetchedArchivedStroiesIsEmpty,
    required TResult orElse(),
  }) {
    if (fetchedArchivedStroiesIsEmpty != null) {
      return fetchedArchivedStroiesIsEmpty(this);
    }
    return orElse();
  }
}

abstract class FetchedArchivedStroiesIsEmpty implements StoryState {
  const factory FetchedArchivedStroiesIsEmpty() =
      _$FetchedArchivedStroiesIsEmptyImpl;
}
