// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String toId, Type type, String content)
        sendTextMessage,
    required TResult Function(String imagePath, String toId) sendImage,
    required TResult Function(String toId) getChatMessages,
    required TResult Function(String query) searchChatUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String toId, Type type, String content)? sendTextMessage,
    TResult? Function(String imagePath, String toId)? sendImage,
    TResult? Function(String toId)? getChatMessages,
    TResult? Function(String query)? searchChatUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String toId, Type type, String content)? sendTextMessage,
    TResult Function(String imagePath, String toId)? sendImage,
    TResult Function(String toId)? getChatMessages,
    TResult Function(String query)? searchChatUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendTextMessage value) sendTextMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(GetChatMessages value) getChatMessages,
    required TResult Function(GetChatUsers value) searchChatUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendTextMessage value)? sendTextMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(GetChatMessages value)? getChatMessages,
    TResult? Function(GetChatUsers value)? searchChatUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendTextMessage value)? sendTextMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(GetChatMessages value)? getChatMessages,
    TResult Function(GetChatUsers value)? searchChatUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SendTextMessageImplCopyWith<$Res> {
  factory _$$SendTextMessageImplCopyWith(_$SendTextMessageImpl value,
          $Res Function(_$SendTextMessageImpl) then) =
      __$$SendTextMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String toId, Type type, String content});
}

/// @nodoc
class __$$SendTextMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendTextMessageImpl>
    implements _$$SendTextMessageImplCopyWith<$Res> {
  __$$SendTextMessageImplCopyWithImpl(
      _$SendTextMessageImpl _value, $Res Function(_$SendTextMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toId = null,
    Object? type = null,
    Object? content = null,
  }) {
    return _then(_$SendTextMessageImpl(
      toId: null == toId
          ? _value.toId
          : toId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendTextMessageImpl
    with DiagnosticableTreeMixin
    implements SendTextMessage {
  const _$SendTextMessageImpl(
      {required this.toId, required this.type, required this.content});

  @override
  final String toId;
  @override
  final Type type;
  @override
  final String content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.sendTextMessage(toId: $toId, type: $type, content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.sendTextMessage'))
      ..add(DiagnosticsProperty('toId', toId))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendTextMessageImpl &&
            (identical(other.toId, toId) || other.toId == toId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toId, type, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendTextMessageImplCopyWith<_$SendTextMessageImpl> get copyWith =>
      __$$SendTextMessageImplCopyWithImpl<_$SendTextMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String toId, Type type, String content)
        sendTextMessage,
    required TResult Function(String imagePath, String toId) sendImage,
    required TResult Function(String toId) getChatMessages,
    required TResult Function(String query) searchChatUsers,
  }) {
    return sendTextMessage(toId, type, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String toId, Type type, String content)? sendTextMessage,
    TResult? Function(String imagePath, String toId)? sendImage,
    TResult? Function(String toId)? getChatMessages,
    TResult? Function(String query)? searchChatUsers,
  }) {
    return sendTextMessage?.call(toId, type, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String toId, Type type, String content)? sendTextMessage,
    TResult Function(String imagePath, String toId)? sendImage,
    TResult Function(String toId)? getChatMessages,
    TResult Function(String query)? searchChatUsers,
    required TResult orElse(),
  }) {
    if (sendTextMessage != null) {
      return sendTextMessage(toId, type, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendTextMessage value) sendTextMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(GetChatMessages value) getChatMessages,
    required TResult Function(GetChatUsers value) searchChatUsers,
  }) {
    return sendTextMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendTextMessage value)? sendTextMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(GetChatMessages value)? getChatMessages,
    TResult? Function(GetChatUsers value)? searchChatUsers,
  }) {
    return sendTextMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendTextMessage value)? sendTextMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(GetChatMessages value)? getChatMessages,
    TResult Function(GetChatUsers value)? searchChatUsers,
    required TResult orElse(),
  }) {
    if (sendTextMessage != null) {
      return sendTextMessage(this);
    }
    return orElse();
  }
}

abstract class SendTextMessage implements ChatEvent {
  const factory SendTextMessage(
      {required final String toId,
      required final Type type,
      required final String content}) = _$SendTextMessageImpl;

  String get toId;
  Type get type;
  String get content;
  @JsonKey(ignore: true)
  _$$SendTextMessageImplCopyWith<_$SendTextMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendImageImplCopyWith<$Res> {
  factory _$$SendImageImplCopyWith(
          _$SendImageImpl value, $Res Function(_$SendImageImpl) then) =
      __$$SendImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String imagePath, String toId});
}

/// @nodoc
class __$$SendImageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendImageImpl>
    implements _$$SendImageImplCopyWith<$Res> {
  __$$SendImageImplCopyWithImpl(
      _$SendImageImpl _value, $Res Function(_$SendImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? toId = null,
  }) {
    return _then(_$SendImageImpl(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      toId: null == toId
          ? _value.toId
          : toId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendImageImpl with DiagnosticableTreeMixin implements SendImage {
  const _$SendImageImpl({required this.imagePath, required this.toId});

  @override
  final String imagePath;
  @override
  final String toId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.sendImage(imagePath: $imagePath, toId: $toId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.sendImage'))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('toId', toId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendImageImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.toId, toId) || other.toId == toId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath, toId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendImageImplCopyWith<_$SendImageImpl> get copyWith =>
      __$$SendImageImplCopyWithImpl<_$SendImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String toId, Type type, String content)
        sendTextMessage,
    required TResult Function(String imagePath, String toId) sendImage,
    required TResult Function(String toId) getChatMessages,
    required TResult Function(String query) searchChatUsers,
  }) {
    return sendImage(imagePath, toId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String toId, Type type, String content)? sendTextMessage,
    TResult? Function(String imagePath, String toId)? sendImage,
    TResult? Function(String toId)? getChatMessages,
    TResult? Function(String query)? searchChatUsers,
  }) {
    return sendImage?.call(imagePath, toId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String toId, Type type, String content)? sendTextMessage,
    TResult Function(String imagePath, String toId)? sendImage,
    TResult Function(String toId)? getChatMessages,
    TResult Function(String query)? searchChatUsers,
    required TResult orElse(),
  }) {
    if (sendImage != null) {
      return sendImage(imagePath, toId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendTextMessage value) sendTextMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(GetChatMessages value) getChatMessages,
    required TResult Function(GetChatUsers value) searchChatUsers,
  }) {
    return sendImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendTextMessage value)? sendTextMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(GetChatMessages value)? getChatMessages,
    TResult? Function(GetChatUsers value)? searchChatUsers,
  }) {
    return sendImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendTextMessage value)? sendTextMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(GetChatMessages value)? getChatMessages,
    TResult Function(GetChatUsers value)? searchChatUsers,
    required TResult orElse(),
  }) {
    if (sendImage != null) {
      return sendImage(this);
    }
    return orElse();
  }
}

abstract class SendImage implements ChatEvent {
  const factory SendImage(
      {required final String imagePath,
      required final String toId}) = _$SendImageImpl;

  String get imagePath;
  String get toId;
  @JsonKey(ignore: true)
  _$$SendImageImplCopyWith<_$SendImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetChatMessagesImplCopyWith<$Res> {
  factory _$$GetChatMessagesImplCopyWith(_$GetChatMessagesImpl value,
          $Res Function(_$GetChatMessagesImpl) then) =
      __$$GetChatMessagesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String toId});
}

/// @nodoc
class __$$GetChatMessagesImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$GetChatMessagesImpl>
    implements _$$GetChatMessagesImplCopyWith<$Res> {
  __$$GetChatMessagesImplCopyWithImpl(
      _$GetChatMessagesImpl _value, $Res Function(_$GetChatMessagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toId = null,
  }) {
    return _then(_$GetChatMessagesImpl(
      toId: null == toId
          ? _value.toId
          : toId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetChatMessagesImpl
    with DiagnosticableTreeMixin
    implements GetChatMessages {
  const _$GetChatMessagesImpl({required this.toId});

  @override
  final String toId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.getChatMessages(toId: $toId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.getChatMessages'))
      ..add(DiagnosticsProperty('toId', toId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetChatMessagesImpl &&
            (identical(other.toId, toId) || other.toId == toId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetChatMessagesImplCopyWith<_$GetChatMessagesImpl> get copyWith =>
      __$$GetChatMessagesImplCopyWithImpl<_$GetChatMessagesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String toId, Type type, String content)
        sendTextMessage,
    required TResult Function(String imagePath, String toId) sendImage,
    required TResult Function(String toId) getChatMessages,
    required TResult Function(String query) searchChatUsers,
  }) {
    return getChatMessages(toId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String toId, Type type, String content)? sendTextMessage,
    TResult? Function(String imagePath, String toId)? sendImage,
    TResult? Function(String toId)? getChatMessages,
    TResult? Function(String query)? searchChatUsers,
  }) {
    return getChatMessages?.call(toId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String toId, Type type, String content)? sendTextMessage,
    TResult Function(String imagePath, String toId)? sendImage,
    TResult Function(String toId)? getChatMessages,
    TResult Function(String query)? searchChatUsers,
    required TResult orElse(),
  }) {
    if (getChatMessages != null) {
      return getChatMessages(toId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendTextMessage value) sendTextMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(GetChatMessages value) getChatMessages,
    required TResult Function(GetChatUsers value) searchChatUsers,
  }) {
    return getChatMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendTextMessage value)? sendTextMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(GetChatMessages value)? getChatMessages,
    TResult? Function(GetChatUsers value)? searchChatUsers,
  }) {
    return getChatMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendTextMessage value)? sendTextMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(GetChatMessages value)? getChatMessages,
    TResult Function(GetChatUsers value)? searchChatUsers,
    required TResult orElse(),
  }) {
    if (getChatMessages != null) {
      return getChatMessages(this);
    }
    return orElse();
  }
}

abstract class GetChatMessages implements ChatEvent {
  const factory GetChatMessages({required final String toId}) =
      _$GetChatMessagesImpl;

  String get toId;
  @JsonKey(ignore: true)
  _$$GetChatMessagesImplCopyWith<_$GetChatMessagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetChatUsersImplCopyWith<$Res> {
  factory _$$GetChatUsersImplCopyWith(
          _$GetChatUsersImpl value, $Res Function(_$GetChatUsersImpl) then) =
      __$$GetChatUsersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$GetChatUsersImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$GetChatUsersImpl>
    implements _$$GetChatUsersImplCopyWith<$Res> {
  __$$GetChatUsersImplCopyWithImpl(
      _$GetChatUsersImpl _value, $Res Function(_$GetChatUsersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetChatUsersImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetChatUsersImpl with DiagnosticableTreeMixin implements GetChatUsers {
  const _$GetChatUsersImpl({required this.query});

  @override
  final String query;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.searchChatUsers(query: $query)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.searchChatUsers'))
      ..add(DiagnosticsProperty('query', query));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetChatUsersImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetChatUsersImplCopyWith<_$GetChatUsersImpl> get copyWith =>
      __$$GetChatUsersImplCopyWithImpl<_$GetChatUsersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String toId, Type type, String content)
        sendTextMessage,
    required TResult Function(String imagePath, String toId) sendImage,
    required TResult Function(String toId) getChatMessages,
    required TResult Function(String query) searchChatUsers,
  }) {
    return searchChatUsers(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String toId, Type type, String content)? sendTextMessage,
    TResult? Function(String imagePath, String toId)? sendImage,
    TResult? Function(String toId)? getChatMessages,
    TResult? Function(String query)? searchChatUsers,
  }) {
    return searchChatUsers?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String toId, Type type, String content)? sendTextMessage,
    TResult Function(String imagePath, String toId)? sendImage,
    TResult Function(String toId)? getChatMessages,
    TResult Function(String query)? searchChatUsers,
    required TResult orElse(),
  }) {
    if (searchChatUsers != null) {
      return searchChatUsers(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendTextMessage value) sendTextMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(GetChatMessages value) getChatMessages,
    required TResult Function(GetChatUsers value) searchChatUsers,
  }) {
    return searchChatUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendTextMessage value)? sendTextMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(GetChatMessages value)? getChatMessages,
    TResult? Function(GetChatUsers value)? searchChatUsers,
  }) {
    return searchChatUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendTextMessage value)? sendTextMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(GetChatMessages value)? getChatMessages,
    TResult Function(GetChatUsers value)? searchChatUsers,
    required TResult orElse(),
  }) {
    if (searchChatUsers != null) {
      return searchChatUsers(this);
    }
    return orElse();
  }
}

abstract class GetChatUsers implements ChatEvent {
  const factory GetChatUsers({required final String query}) =
      _$GetChatUsersImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$GetChatUsersImplCopyWith<_$GetChatUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Message> messages) chatLoaded,
    required TResult Function() chatIsEmpty,
    required TResult Function(String error) error,
    required TResult Function(List<ChatUserWithUserProfile> users)
        chatUsersSearchResult,
    required TResult Function() chatUsersSearchResultIsEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Message> messages)? chatLoaded,
    TResult? Function()? chatIsEmpty,
    TResult? Function(String error)? error,
    TResult? Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult? Function()? chatUsersSearchResultIsEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Message> messages)? chatLoaded,
    TResult Function()? chatIsEmpty,
    TResult Function(String error)? error,
    TResult Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult Function()? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatIsEmpty value) chatIsEmpty,
    required TResult Function(Error value) error,
    required TResult Function(ChatUsersSearchResult value)
        chatUsersSearchResult,
    required TResult Function(SearchResultIsEmpty value)
        chatUsersSearchResultIsEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatIsEmpty value)? chatIsEmpty,
    TResult? Function(Error value)? error,
    TResult? Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult? Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatIsEmpty value)? chatIsEmpty,
    TResult Function(Error value)? error,
    TResult Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

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
    extends _$ChatStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ChatState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ChatState.initial'));
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
    required TResult Function(List<Message> messages) chatLoaded,
    required TResult Function() chatIsEmpty,
    required TResult Function(String error) error,
    required TResult Function(List<ChatUserWithUserProfile> users)
        chatUsersSearchResult,
    required TResult Function() chatUsersSearchResultIsEmpty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Message> messages)? chatLoaded,
    TResult? Function()? chatIsEmpty,
    TResult? Function(String error)? error,
    TResult? Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult? Function()? chatUsersSearchResultIsEmpty,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Message> messages)? chatLoaded,
    TResult Function()? chatIsEmpty,
    TResult Function(String error)? error,
    TResult Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult Function()? chatUsersSearchResultIsEmpty,
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
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatIsEmpty value) chatIsEmpty,
    required TResult Function(Error value) error,
    required TResult Function(ChatUsersSearchResult value)
        chatUsersSearchResult,
    required TResult Function(SearchResultIsEmpty value)
        chatUsersSearchResultIsEmpty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatIsEmpty value)? chatIsEmpty,
    TResult? Function(Error value)? error,
    TResult? Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult? Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatIsEmpty value)? chatIsEmpty,
    TResult Function(Error value)? error,
    TResult Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ChatState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ChatLoadedImplCopyWith<$Res> {
  factory _$$ChatLoadedImplCopyWith(
          _$ChatLoadedImpl value, $Res Function(_$ChatLoadedImpl) then) =
      __$$ChatLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Message> messages});
}

/// @nodoc
class __$$ChatLoadedImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatLoadedImpl>
    implements _$$ChatLoadedImplCopyWith<$Res> {
  __$$ChatLoadedImplCopyWithImpl(
      _$ChatLoadedImpl _value, $Res Function(_$ChatLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$ChatLoadedImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$ChatLoadedImpl with DiagnosticableTreeMixin implements ChatLoaded {
  const _$ChatLoadedImpl({required final List<Message> messages})
      : _messages = messages;

  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState.chatLoaded(messages: $messages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatState.chatLoaded'))
      ..add(DiagnosticsProperty('messages', messages));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatLoadedImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatLoadedImplCopyWith<_$ChatLoadedImpl> get copyWith =>
      __$$ChatLoadedImplCopyWithImpl<_$ChatLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Message> messages) chatLoaded,
    required TResult Function() chatIsEmpty,
    required TResult Function(String error) error,
    required TResult Function(List<ChatUserWithUserProfile> users)
        chatUsersSearchResult,
    required TResult Function() chatUsersSearchResultIsEmpty,
  }) {
    return chatLoaded(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Message> messages)? chatLoaded,
    TResult? Function()? chatIsEmpty,
    TResult? Function(String error)? error,
    TResult? Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult? Function()? chatUsersSearchResultIsEmpty,
  }) {
    return chatLoaded?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Message> messages)? chatLoaded,
    TResult Function()? chatIsEmpty,
    TResult Function(String error)? error,
    TResult Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult Function()? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) {
    if (chatLoaded != null) {
      return chatLoaded(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatIsEmpty value) chatIsEmpty,
    required TResult Function(Error value) error,
    required TResult Function(ChatUsersSearchResult value)
        chatUsersSearchResult,
    required TResult Function(SearchResultIsEmpty value)
        chatUsersSearchResultIsEmpty,
  }) {
    return chatLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatIsEmpty value)? chatIsEmpty,
    TResult? Function(Error value)? error,
    TResult? Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult? Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
  }) {
    return chatLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatIsEmpty value)? chatIsEmpty,
    TResult Function(Error value)? error,
    TResult Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) {
    if (chatLoaded != null) {
      return chatLoaded(this);
    }
    return orElse();
  }
}

abstract class ChatLoaded implements ChatState {
  const factory ChatLoaded({required final List<Message> messages}) =
      _$ChatLoadedImpl;

  List<Message> get messages;
  @JsonKey(ignore: true)
  _$$ChatLoadedImplCopyWith<_$ChatLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatIsEmptyImplCopyWith<$Res> {
  factory _$$ChatIsEmptyImplCopyWith(
          _$ChatIsEmptyImpl value, $Res Function(_$ChatIsEmptyImpl) then) =
      __$$ChatIsEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatIsEmptyImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatIsEmptyImpl>
    implements _$$ChatIsEmptyImplCopyWith<$Res> {
  __$$ChatIsEmptyImplCopyWithImpl(
      _$ChatIsEmptyImpl _value, $Res Function(_$ChatIsEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChatIsEmptyImpl with DiagnosticableTreeMixin implements ChatIsEmpty {
  const _$ChatIsEmptyImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState.chatIsEmpty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ChatState.chatIsEmpty'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatIsEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Message> messages) chatLoaded,
    required TResult Function() chatIsEmpty,
    required TResult Function(String error) error,
    required TResult Function(List<ChatUserWithUserProfile> users)
        chatUsersSearchResult,
    required TResult Function() chatUsersSearchResultIsEmpty,
  }) {
    return chatIsEmpty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Message> messages)? chatLoaded,
    TResult? Function()? chatIsEmpty,
    TResult? Function(String error)? error,
    TResult? Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult? Function()? chatUsersSearchResultIsEmpty,
  }) {
    return chatIsEmpty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Message> messages)? chatLoaded,
    TResult Function()? chatIsEmpty,
    TResult Function(String error)? error,
    TResult Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult Function()? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) {
    if (chatIsEmpty != null) {
      return chatIsEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatIsEmpty value) chatIsEmpty,
    required TResult Function(Error value) error,
    required TResult Function(ChatUsersSearchResult value)
        chatUsersSearchResult,
    required TResult Function(SearchResultIsEmpty value)
        chatUsersSearchResultIsEmpty,
  }) {
    return chatIsEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatIsEmpty value)? chatIsEmpty,
    TResult? Function(Error value)? error,
    TResult? Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult? Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
  }) {
    return chatIsEmpty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatIsEmpty value)? chatIsEmpty,
    TResult Function(Error value)? error,
    TResult Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) {
    if (chatIsEmpty != null) {
      return chatIsEmpty(this);
    }
    return orElse();
  }
}

abstract class ChatIsEmpty implements ChatState {
  const factory ChatIsEmpty() = _$ChatIsEmptyImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements Error {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Message> messages) chatLoaded,
    required TResult Function() chatIsEmpty,
    required TResult Function(String error) error,
    required TResult Function(List<ChatUserWithUserProfile> users)
        chatUsersSearchResult,
    required TResult Function() chatUsersSearchResultIsEmpty,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Message> messages)? chatLoaded,
    TResult? Function()? chatIsEmpty,
    TResult? Function(String error)? error,
    TResult? Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult? Function()? chatUsersSearchResultIsEmpty,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Message> messages)? chatLoaded,
    TResult Function()? chatIsEmpty,
    TResult Function(String error)? error,
    TResult Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult Function()? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatIsEmpty value) chatIsEmpty,
    required TResult Function(Error value) error,
    required TResult Function(ChatUsersSearchResult value)
        chatUsersSearchResult,
    required TResult Function(SearchResultIsEmpty value)
        chatUsersSearchResultIsEmpty,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatIsEmpty value)? chatIsEmpty,
    TResult? Function(Error value)? error,
    TResult? Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult? Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatIsEmpty value)? chatIsEmpty,
    TResult Function(Error value)? error,
    TResult Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ChatState {
  const factory Error({required final String error}) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatUsersSearchResultImplCopyWith<$Res> {
  factory _$$ChatUsersSearchResultImplCopyWith(
          _$ChatUsersSearchResultImpl value,
          $Res Function(_$ChatUsersSearchResultImpl) then) =
      __$$ChatUsersSearchResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ChatUserWithUserProfile> users});
}

/// @nodoc
class __$$ChatUsersSearchResultImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatUsersSearchResultImpl>
    implements _$$ChatUsersSearchResultImplCopyWith<$Res> {
  __$$ChatUsersSearchResultImplCopyWithImpl(_$ChatUsersSearchResultImpl _value,
      $Res Function(_$ChatUsersSearchResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$ChatUsersSearchResultImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<ChatUserWithUserProfile>,
    ));
  }
}

/// @nodoc

class _$ChatUsersSearchResultImpl
    with DiagnosticableTreeMixin
    implements ChatUsersSearchResult {
  const _$ChatUsersSearchResultImpl(
      {required final List<ChatUserWithUserProfile> users})
      : _users = users;

  final List<ChatUserWithUserProfile> _users;
  @override
  List<ChatUserWithUserProfile> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState.chatUsersSearchResult(users: $users)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatState.chatUsersSearchResult'))
      ..add(DiagnosticsProperty('users', users));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatUsersSearchResultImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatUsersSearchResultImplCopyWith<_$ChatUsersSearchResultImpl>
      get copyWith => __$$ChatUsersSearchResultImplCopyWithImpl<
          _$ChatUsersSearchResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Message> messages) chatLoaded,
    required TResult Function() chatIsEmpty,
    required TResult Function(String error) error,
    required TResult Function(List<ChatUserWithUserProfile> users)
        chatUsersSearchResult,
    required TResult Function() chatUsersSearchResultIsEmpty,
  }) {
    return chatUsersSearchResult(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Message> messages)? chatLoaded,
    TResult? Function()? chatIsEmpty,
    TResult? Function(String error)? error,
    TResult? Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult? Function()? chatUsersSearchResultIsEmpty,
  }) {
    return chatUsersSearchResult?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Message> messages)? chatLoaded,
    TResult Function()? chatIsEmpty,
    TResult Function(String error)? error,
    TResult Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult Function()? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) {
    if (chatUsersSearchResult != null) {
      return chatUsersSearchResult(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatIsEmpty value) chatIsEmpty,
    required TResult Function(Error value) error,
    required TResult Function(ChatUsersSearchResult value)
        chatUsersSearchResult,
    required TResult Function(SearchResultIsEmpty value)
        chatUsersSearchResultIsEmpty,
  }) {
    return chatUsersSearchResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatIsEmpty value)? chatIsEmpty,
    TResult? Function(Error value)? error,
    TResult? Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult? Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
  }) {
    return chatUsersSearchResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatIsEmpty value)? chatIsEmpty,
    TResult Function(Error value)? error,
    TResult Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) {
    if (chatUsersSearchResult != null) {
      return chatUsersSearchResult(this);
    }
    return orElse();
  }
}

abstract class ChatUsersSearchResult implements ChatState {
  const factory ChatUsersSearchResult(
          {required final List<ChatUserWithUserProfile> users}) =
      _$ChatUsersSearchResultImpl;

  List<ChatUserWithUserProfile> get users;
  @JsonKey(ignore: true)
  _$$ChatUsersSearchResultImplCopyWith<_$ChatUsersSearchResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchResultIsEmptyImplCopyWith<$Res> {
  factory _$$SearchResultIsEmptyImplCopyWith(_$SearchResultIsEmptyImpl value,
          $Res Function(_$SearchResultIsEmptyImpl) then) =
      __$$SearchResultIsEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchResultIsEmptyImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$SearchResultIsEmptyImpl>
    implements _$$SearchResultIsEmptyImplCopyWith<$Res> {
  __$$SearchResultIsEmptyImplCopyWithImpl(_$SearchResultIsEmptyImpl _value,
      $Res Function(_$SearchResultIsEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchResultIsEmptyImpl
    with DiagnosticableTreeMixin
    implements SearchResultIsEmpty {
  const _$SearchResultIsEmptyImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState.chatUsersSearchResultIsEmpty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'ChatState.chatUsersSearchResultIsEmpty'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultIsEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Message> messages) chatLoaded,
    required TResult Function() chatIsEmpty,
    required TResult Function(String error) error,
    required TResult Function(List<ChatUserWithUserProfile> users)
        chatUsersSearchResult,
    required TResult Function() chatUsersSearchResultIsEmpty,
  }) {
    return chatUsersSearchResultIsEmpty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Message> messages)? chatLoaded,
    TResult? Function()? chatIsEmpty,
    TResult? Function(String error)? error,
    TResult? Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult? Function()? chatUsersSearchResultIsEmpty,
  }) {
    return chatUsersSearchResultIsEmpty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Message> messages)? chatLoaded,
    TResult Function()? chatIsEmpty,
    TResult Function(String error)? error,
    TResult Function(List<ChatUserWithUserProfile> users)?
        chatUsersSearchResult,
    TResult Function()? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) {
    if (chatUsersSearchResultIsEmpty != null) {
      return chatUsersSearchResultIsEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatIsEmpty value) chatIsEmpty,
    required TResult Function(Error value) error,
    required TResult Function(ChatUsersSearchResult value)
        chatUsersSearchResult,
    required TResult Function(SearchResultIsEmpty value)
        chatUsersSearchResultIsEmpty,
  }) {
    return chatUsersSearchResultIsEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatIsEmpty value)? chatIsEmpty,
    TResult? Function(Error value)? error,
    TResult? Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult? Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
  }) {
    return chatUsersSearchResultIsEmpty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatIsEmpty value)? chatIsEmpty,
    TResult Function(Error value)? error,
    TResult Function(ChatUsersSearchResult value)? chatUsersSearchResult,
    TResult Function(SearchResultIsEmpty value)? chatUsersSearchResultIsEmpty,
    required TResult orElse(),
  }) {
    if (chatUsersSearchResultIsEmpty != null) {
      return chatUsersSearchResultIsEmpty(this);
    }
    return orElse();
  }
}

abstract class SearchResultIsEmpty implements ChatState {
  const factory SearchResultIsEmpty() = _$SearchResultIsEmptyImpl;
}
