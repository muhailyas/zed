part of 'freinds_list_bloc.dart';

class FreindsListEvent {}

class FetchFriendsListEvent extends FreindsListEvent {
  final Friend friend;
  final String userId;
  FetchFriendsListEvent({required this.friend, required this.userId});
}

class RemoveFollower extends FreindsListEvent {
  final String userId;
  RemoveFollower({required this.userId});
}
