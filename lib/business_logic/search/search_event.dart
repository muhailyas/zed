part of 'search_bloc.dart';

class SearchEvent {}

class UserSearchEvent extends SearchEvent {
  final String query;
  UserSearchEvent({required this.query});
}

class InitialSearch extends SearchEvent {}
