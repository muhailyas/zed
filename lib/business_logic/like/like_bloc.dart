import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:zed/data/repositories/like_repository/like_repositories.dart';
part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeRepository likeRepository;
  LikeBloc(this.likeRepository) : super(LikeInitial(likes: [])) {
    on<LikeButtonEvent>(likeButtonEvent);
    on<LikeFetchEvent>(likeFetchEvent);
  }

  FutureOr<void> likeButtonEvent(
      LikeButtonEvent event, Emitter<LikeState> emit) async {
    List likes = await likeRepository.fetchLikes(event.postId);
    final result =
        await likeRepository.toggleLike(event.postId, event.userId, likes);
    likes = await likeRepository.fetchLikes(event.postId);
    emit(result.fold(
        (error) => LikeErrorState(likes: likes),
        (liked) =>
            liked ? LikedState(likes: likes) : UnlikedState(likes: likes)));
  }

  FutureOr<void> likeFetchEvent(
      LikeFetchEvent event, Emitter<LikeState> emit) async {
    final likes = await likeRepository.fetchLikes(event.postId);
    emit(LikeInitial(likes: likes));
  }
}
