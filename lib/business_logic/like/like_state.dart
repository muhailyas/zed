part of 'like_bloc.dart';

class LikeState {}

final class LikeInitial extends LikeState {
  List likes;
  LikeInitial({required this.likes});
}

final class LikeErrorState extends LikeState {}

final class LikedState extends LikeState {}

final class UnlikedState extends LikeState {
  List? likes;
  UnlikedState({this.likes});
}
