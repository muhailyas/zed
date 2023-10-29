part of 'like_bloc.dart';

class LikeState {
  List likes;
  LikeState({required this.likes});
}

final class LikeInitial extends LikeState {
  LikeInitial({required super.likes});
}

final class LikeErrorState extends LikeState {
  LikeErrorState({required super.likes});
}

final class LikedState extends LikeState {
  LikedState({required super.likes});
}

final class UnlikedState extends LikeState {
  UnlikedState({required super.likes});
}
