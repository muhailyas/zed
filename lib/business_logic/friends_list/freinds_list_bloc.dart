import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/data/repositories/follow_repository/follow_repository.dart';
import 'package:zed/utils/enums/enums.dart';

part 'freinds_list_event.dart';
part 'freinds_list_state.dart';

class FreindsListBloc extends Bloc<FreindsListEvent, FreindsListState> {
  final FollowRepository followRepository;
  FreindsListBloc(this.followRepository) : super(FreindsListInitial()) {
    on<FetchFriendsListEvent>(fetchFriendsList);
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
}
