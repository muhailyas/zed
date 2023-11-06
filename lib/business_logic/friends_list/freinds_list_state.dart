part of 'freinds_list_bloc.dart';

class FreindsListState {}

final class FreindsListInitial extends FreindsListState {}

class FriendsListFetchSuccess extends FreindsListState {
  final List<UserProfile> freinds;
  final bool isRemoved;
  FriendsListFetchSuccess({required this.freinds, this.isRemoved = false});
}
