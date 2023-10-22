import 'dart:async';
import 'package:bloc/bloc.dart';
part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationInitial()) {
    on<IndexChagerEvent>(indexChagerEvent);
  }

  FutureOr<void> indexChagerEvent(
      IndexChagerEvent event, Emitter<BottomNavigationState> emit) {
    emit(BottomNavigationState(index: event.index));
  }
}
