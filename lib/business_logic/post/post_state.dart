part of 'post_bloc.dart';

class PostState {}

class PostImageSelected extends PostState {
  String? image;
  PostImageSelected({this.image});
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class ClosePostScreenToHome extends PostState {}

class PostAddSuccess extends PostState {}
