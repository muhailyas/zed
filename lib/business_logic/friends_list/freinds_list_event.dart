part of 'freinds_list_bloc.dart';

class FreindsListEvent {}

class FetchFriendsListEvent extends FreindsListEvent {
  final Friend friend;
  final String userId;
  FetchFriendsListEvent({required this.friend, required this.userId});
}
