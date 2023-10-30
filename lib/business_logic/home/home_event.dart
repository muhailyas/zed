part of 'home_bloc.dart';

class HomeEvent {}

class FetchingPostEvent extends HomeEvent {}

class DeletePostEvent extends HomeEvent {
  final String postId;
  DeletePostEvent({required this.postId});
}
