import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:zed/data/repositories/like_repositories/like_repositories.dart';
part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeRepository likeRepository;
  LikeBloc(this.likeRepository) : super(LikeInitial(likes: [])) {
    on<LikeButtonEvent>(likeButtonEvent);
  }

  FutureOr<void> likeButtonEvent(
      LikeButtonEvent event, Emitter<LikeState> emit) async {
    final userId = event.userId;
    final postId = event.postId;
    final likes = event.likes;

    final result = await likeRepository.toggleLike(postId, userId, likes);
    emit(result.fold((error) => LikeErrorState(), (liked) {
      print(liked);
      return liked ? LikedState() : UnlikedState();
    }));
    print("hello");
  }
}
