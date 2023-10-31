import 'dart:async';
import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jcc/repositories/notification_repository.dart';

import '../../models/notification_model.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {

  bool descending = true;

  NotificationBloc({required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository,
        super(NotificationInitial()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<UpdateNotification>(_onUpdateNotification);
  }

  final NotificationRepository _notificationRepository;
  StreamSubscription? _notificationSubscription;



  FutureOr<void> _onUpdateNotification(
      UpdateNotification event, Emitter<NotificationState> emit) {
    emit(NotificationLoaded(event.notificationList));
  }

  FutureOr<void> _onLoadNotifications(
      LoadNotifications event, Emitter<NotificationState> emit) {
    _notificationSubscription?.cancel();

    try {
      dev.log('state is  $descending');
      _notificationSubscription =
          _notificationRepository.getNotification().listen((list) {
        add(UpdateNotification(list));
      });
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }



  @override
  void onTransition(
      Transition<NotificationEvent, NotificationState> transition) {
    super.onTransition(transition);
    dev.log(transition.toString(), name: "Notification Screen");
  }


}
