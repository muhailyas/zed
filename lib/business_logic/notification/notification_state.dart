part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = Loading;
  const factory NotificationState.fetchedSuccess(
          {required List<NotificationWithUserProfile> notifications}) =
      FetchedSucces;
}
