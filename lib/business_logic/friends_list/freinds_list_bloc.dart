import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/data/repositories/follow_repository/follow_repository.dart';
import 'package:zed/utils/enums/enums.dart';

part 'freinds_list_event.dart';
part 'freinds_list_state.dart';

class FreindsListBloc extends Bloc<FreindsListEvent, FreindsListState> {
  final FollowRepository followRepository;
  FreindsListBloc(this.followRepository) : super(FreindsListInitial()) {
    on<FetchFriendsListEvent>(fetchFriendsList);
    on<RemoveFollower>(removeFollower);
  }

  FutureOr<void> fetchFriendsList(
      FetchFriendsListEvent event, Emitter<FreindsListState> emit) async {
    List<UserProfile> friends = [];
    if (Friend.followers == event.friend) {
      friends = await followRepository.getFollowersList(uid: event.userId);
    } else {
      friends = await followRepository.getFollowingList(uid: event.userId);
    }
    emit(FriendsListFetchSuccess(freinds: friends));
  }

  FutureOr<void> removeFollower(
      RemoveFollower event, Emitter<FreindsListState> emit) async {
    await followRepository.removeFollower(
        uid: FirebaseAuth.instance.currentUser!.uid, followerId: event.userId);
    List<UserProfile> friends = [];
    friends = await followRepository.getFollowersList(
        uid: FirebaseAuth.instance.currentUser!.uid);
    emit(FriendsListFetchSuccess(freinds: friends, isRemoved: true));
  }
}
