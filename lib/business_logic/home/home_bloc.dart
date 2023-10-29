import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/repositories/post_repository/post_repositories.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  PostRepository postRepository;
  HomeBloc(this.postRepository) : super(HomeInitial()) {
    on<FetchingPostEvent>(fetchingPostEvent);
  }

  FutureOr<void> fetchingPostEvent(
      FetchingPostEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final posts = await postRepository.fetchPosts();
    emit(PostFetchingSuccess(posts: posts));
  }
}
