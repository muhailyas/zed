import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zed/data/data_sources/notification_data_source/notification_data_source.dart';
import 'package:zed/data/models/notification/notification.dart';
part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const _Initial()) {
    on<FetchNotifications>(fetchNotifications);
  }

  FutureOr<void> fetchNotifications(
      FetchNotifications event, Emitter<NotificationState> emit) async {
    emit(const NotificationState.loading());
    final notifications = await NotificationDataSource().getUserNotifications();
    emit(NotificationState.fetchedSuccess(notifications: notifications));
  }
}
