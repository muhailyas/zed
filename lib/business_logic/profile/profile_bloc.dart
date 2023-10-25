import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/data/repositories/user_repositories/user_repositories.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserRepository userRepository;
  ProfileBloc(this.userRepository) : super(ProfileLoading()) {
    on<UserInfoFetchEvent>(userInfoFetchEvent);
    on<UserPostsFetchEvent>(userPostsFetchEvent);
  }

  FutureOr<void> userInfoFetchEvent(
      UserInfoFetchEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final user = await userRepository
        .getUserByUid(FirebaseAuth.instance.currentUser!.uid);
    emit(UserInfoFetchSuccess(userProfile: user));
  }

  FutureOr<void> userPostsFetchEvent(
      UserPostsFetchEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final posts = await userRepository
        .getUserPosts(FirebaseAuth.instance.currentUser!.uid);
    emit(UserPostsFetchSuccess(posts: posts));
  }
}
