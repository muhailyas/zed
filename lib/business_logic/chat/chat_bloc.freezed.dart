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
  String get toId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String toId, Type type, String content)
        sendTextMessage,
    required TResult Function(String imagePath, String toId) sendImage,
    required TResult Function(String toId) getChatMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String toId, Type type, String content)? sendTextMessage,
    TResult? Function(String imagePath, String toId)? sendImage,
    TResult? Function(String toId)? getChatMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String toId, Type type, String content)? sendTextMessage,
    TResult Function(String imagePath, String toId)? sendImage,
    TResult Function(String toId)? getChatMessages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendTextMessage value) sendTextMessage,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(GetChatMessages value) getChatMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendTextMessage value)? sendTextMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(GetChatMessages value)? getChatMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendTextMessage value)? sendTextMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(GetChatMessages value)? getChatMessages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatEventCopyWith<ChatEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
  @useResult
  $Res call({String toId});
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toId = null,
  }) {
    return _then(_value.copyWith(
      toId: null == toId
          ? _value.toId
          : toId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendTextMessageImplCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$SendTextMessageImplCopyWith(_$SendTextMessageImpl value,
          $Res Function(_$SendTextMessageImpl) then) =
      __$$SendTextMessageImplCopyWithImpl<$Res>;
  @override
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

class _$SendTextMessageImpl implements SendTextMessage {
  const _$SendTextMessageImpl(
      {required this.toId, required this.type, required this.content});

  @override
  final String toId;
  @override
  final Type type;
  @override
  final String content;

  @override
  String toString() {
    return 'ChatEvent.sendTextMessage(toId: $toId, type: $type, content: $content)';
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
  }) {
    return sendTextMessage(toId, type, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String toId, Type type, String content)? sendTextMessage,
    TResult? Function(String imagePath, String toId)? sendImage,
    TResult? Function(String toId)? getChatMessages,
  }) {
    return sendTextMessage?.call(toId, type, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String toId, Type type, String content)? sendTextMessage,
    TResult Function(String imagePath, String toId)? sendImage,
    TResult Function(String toId)? getChatMessages,
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
  }) {
    return sendTextMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendTextMessage value)? sendTextMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(GetChatMessages value)? getChatMessages,
  }) {
    return sendTextMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendTextMessage value)? sendTextMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(GetChatMessages value)? getChatMessages,
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

  @override
  String get toId;
  Type get type;
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$SendTextMessageImplCopyWith<_$SendTextMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendImageImplCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$SendImageImplCopyWith(
          _$SendImageImpl value, $Res Function(_$SendImageImpl) then) =
      __$$SendImageImplCopyWithImpl<$Res>;
  @override
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

class _$SendImageImpl implements SendImage {
  const _$SendImageImpl({required this.imagePath, required this.toId});

  @override
  final String imagePath;
  @override
  final String toId;

  @override
  String toString() {
    return 'ChatEvent.sendImage(imagePath: $imagePath, toId: $toId)';
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
  }) {
    return sendImage(imagePath, toId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String toId, Type type, String content)? sendTextMessage,
    TResult? Function(String imagePath, String toId)? sendImage,
    TResult? Function(String toId)? getChatMessages,
  }) {
    return sendImage?.call(imagePath, toId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String toId, Type type, String content)? sendTextMessage,
    TResult Function(String imagePath, String toId)? sendImage,
    TResult Function(String toId)? getChatMessages,
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
  }) {
    return sendImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendTextMessage value)? sendTextMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(GetChatMessages value)? getChatMessages,
  }) {
    return sendImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendTextMessage value)? sendTextMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(GetChatMessages value)? getChatMessages,
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
  @override
  String get toId;
  @override
  @JsonKey(ignore: true)
  _$$SendImageImplCopyWith<_$SendImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetChatMessagesImplCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$GetChatMessagesImplCopyWith(_$GetChatMessagesImpl value,
          $Res Function(_$GetChatMessagesImpl) then) =
      __$$GetChatMessagesImplCopyWithImpl<$Res>;
  @override
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

class _$GetChatMessagesImpl implements GetChatMessages {
  const _$GetChatMessagesImpl({required this.toId});

  @override
  final String toId;

  @override
  String toString() {
    return 'ChatEvent.getChatMessages(toId: $toId)';
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
  }) {
    return getChatMessages(toId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String toId, Type type, String content)? sendTextMessage,
    TResult? Function(String imagePath, String toId)? sendImage,
    TResult? Function(String toId)? getChatMessages,
  }) {
    return getChatMessages?.call(toId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String toId, Type type, String content)? sendTextMessage,
    TResult Function(String imagePath, String toId)? sendImage,
    TResult Function(String toId)? getChatMessages,
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
  }) {
    return getChatMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendTextMessage value)? sendTextMessage,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(GetChatMessages value)? getChatMessages,
  }) {
    return getChatMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendTextMessage value)? sendTextMessage,
    TResult Function(SendImage value)? sendImage,
    TResult Function(GetChatMessages value)? getChatMessages,
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

  @override
  String get toId;
  @override
  @JsonKey(ignore: true)
  _$$GetChatMessagesImplCopyWith<_$GetChatMessagesImpl> get copyWith =>
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Message> messages)? chatLoaded,
    TResult? Function()? chatIsEmpty,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Message> messages)? chatLoaded,
    TResult Function()? chatIsEmpty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ChatLoaded value) chatLoaded,
    required TResult Function(ChatIsEmpty value) chatIsEmpty,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(ChatLoaded value)? chatLoaded,
    TResult? Function(ChatIsEmpty value)? chatIsEmpty,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ChatLoaded value)? chatLoaded,
    TResult Function(ChatIsEmpty value)? chatIsEmpty,
    TResult Function(Error value)? error,
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

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ChatState.initial()';
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

class _$ChatLoadedImpl implements ChatLoaded {
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
  String toString() {
    return 'ChatState.chatLoaded(messages: $messages)';
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

class _$ChatIsEmptyImpl implements ChatIsEmpty {
  const _$ChatIsEmptyImpl();

  @override
  String toString() {
    return 'ChatState.chatIsEmpty()';
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

class _$ErrorImpl implements Error {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ChatState.error(error: $error)';
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
