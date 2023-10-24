part of 'post_bloc.dart';

class PostState {
  String? image;
  PostState({this.image});
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class ClosePostScreenToHome extends PostState {}

class PostAddSuccess extends PostState {}
