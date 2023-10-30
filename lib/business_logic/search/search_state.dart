part of 'search_bloc.dart';

class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchResultEmpty extends SearchState {}

class SearchResultFound extends SearchState {
  final List<UserProfile> users;
  SearchResultFound({required this.users});
}
