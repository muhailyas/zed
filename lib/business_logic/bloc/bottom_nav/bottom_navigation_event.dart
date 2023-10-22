part of 'bottom_navigation_bloc.dart';

class BottomNavigationEvent {}

class IndexChagerEvent extends BottomNavigationEvent {
  final int index;
  IndexChagerEvent({required this.index});
}
