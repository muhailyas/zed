part of 'home_bloc.dart';

class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class PostFetchingSuccess extends HomeState {
  List<Post> posts;
  PostFetchingSuccess({required this.posts});
}
