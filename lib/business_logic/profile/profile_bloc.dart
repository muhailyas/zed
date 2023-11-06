import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/data/repositories/follow_repository/follow_repository.dart';
import 'package:zed/data/repositories/post_repository/post_repositories.dart';
import 'package:zed/data/repositories/user_repository/user_repositories.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserRepository userRepository;
  PostRepository postRepository;
  FollowRepository followRepository;
  ProfileBloc(this.userRepository, this.postRepository, this.followRepository)
      : super(ProfileInitial()) {
    on<ProfileFetchEvent>(profileFetchEvent);
  }
  FutureOr<void> profileFetchEvent(
      ProfileFetchEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final user = await userRepository.getUserByUid(event.userId);
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final posts = await userRepository.getUserPosts(uid);
    final savedPosts = await postRepository.fetchSavedPosts(userId: uid);
    emit(ProfileFetchSuccess(
        userProfile: user, posts: posts, savedPosts: savedPosts));
  }
}
