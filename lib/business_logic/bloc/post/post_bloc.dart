import 'dart:async';
import 'package:bloc/bloc.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<ClosePostScreenEvent>(closePostScreenEvent);
  }

  FutureOr<void> closePostScreenEvent(
      ClosePostScreenEvent event, Emitter<PostState> emit) {
    emit(ClosePostScreenToHomeActionState());
  }
}
