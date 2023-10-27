import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/data/repositories/user_repositories/user_repositories.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  UserRepository userRepository;
  SearchBloc(this.userRepository) : super(SearchInitial()) {
    on<UserSearchEvent>(userSearchEvent);
  }

  FutureOr<void> userSearchEvent(
      UserSearchEvent event, Emitter<SearchState> emit) async {
    SearchLoading();
    final users = await userRepository.searchUsersByUsername(event.query);
    users.isEmpty
        ? event.query.isEmpty
            ? emit(EmptySearchFeildState())
            : emit(SearchResultEmpty())
        : emit(SearchResultFound(users: users));
  }
}
