import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jcc/models/notification_model.dart';
import 'package:jcc/repositories/complaint_repository.dart';
import 'package:jcc/repositories/notification_repository.dart';

part 'complaint_register_event.dart';

part 'complaint_register_state.dart';

class ComplaintRegisterBloc
    extends Bloc<ComplaintRegisterEvent, ComplaintRegisterState> {
  ComplaintRegisterBloc(
      {required ComplaintRepository complaintRepository,
      required NotificationRepository notificationRepository})
      : _complaintRepository = complaintRepository,
        _notificationRepository = notificationRepository,
        super(ComplaintRegisterInitial()) {
    on<RegisterComplaint>(_onRegisterComplaint);
  }

  final ComplaintRepository _complaintRepository;
  final NotificationRepository _notificationRepository;

  Future<void> _onRegisterComplaint(
    RegisterComplaint event,
    Emitter<ComplaintRegisterState> emit,
  ) async {
    emit(ComplaintRegistering());
    final complaintData = event.complaintData;
    complaintData['images'] = event.images;
    complaintData['id'] = event.id;
    complaintData['userId'] = event.userId;
    complaintData['userName'] = event.userName;

    final response =
        await _complaintRepository.registerComplaint(complaintData);

    if (response == null) {
      emit(const ComplaintRegisterFailure('Something went wrong!'));
    } else {
      emit(ComplaintRegisterSuccess(response.id));

      final notification = NotificationModel(
        timeStamp: DateTime.now(),
        departmentName: response.departmentName,
        description: 'New complaint registered!',
        complaintId: response.id,
        userId: response.userId,
        ward: response.ward,
      );

      await _notificationRepository.addNotification(notification);
    }
  }
}
