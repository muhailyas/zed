part of 'user_bloc.dart';

class UserState {
  bool isSaving;
  UserState({this.isSaving = false});
}

final class UserInitial extends UserState {}
