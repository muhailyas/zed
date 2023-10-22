part of 'bottom_navigation_bloc.dart';

class BottomNavigationState {
  final int index;
  BottomNavigationState({required this.index});
}

final class BottomNavigationInitial extends BottomNavigationState {
  BottomNavigationInitial() : super(index: 0);
}
