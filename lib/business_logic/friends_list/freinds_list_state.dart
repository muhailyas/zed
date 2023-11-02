part of 'freinds_list_bloc.dart';

class FreindsListState {}

final class FreindsListInitial extends FreindsListState {}

class FriendsListFetchSuccess extends FreindsListState {
  final List<UserProfile> freinds;
  FriendsListFetchSuccess({required this.freinds});
}
