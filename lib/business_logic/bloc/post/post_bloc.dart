import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:zed/data/data_providers/image_upload_to_storage/image_upload_to_storage.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/repositories/post_repositories/post_repositories.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<ClosePostScreenEvent>(closePostScreenEvent);
    on<AddPostEvent>(addPostEvent);
  }

  FutureOr<void> closePostScreenEvent(
      ClosePostScreenEvent event, Emitter<PostState> emit) {
    emit(ClosePostScreenToHome());
  }

  FutureOr<void> addPostEvent(
      AddPostEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    final imageUrl = await FireStoreStorage()
        .uploadImageAndGetUrl(event.post.imageUrl, 'posts');
    event.post.imageUrl = imageUrl;

    await PostRepository().addPost(event.post);
    
    emit(PostAddSuccess());
  }
}
