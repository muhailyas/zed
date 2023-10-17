import 'package:bloc/bloc.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/data/repositories/user_repositories/user_repositories.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<CreateUserEvent>((event, emit) async {
      emit(UserState(isSaving: true));
      await UserRepository.addUser(event.userProfile);
      emit(UserState(isSaving: false));
    });
  }
}
