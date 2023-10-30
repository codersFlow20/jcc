import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jcc/repositories/complaint_repository.dart';

part 'complaint_register_event.dart';

part 'complaint_register_state.dart';

class ComplaintRegisterBloc
    extends Bloc<ComplaintRegisterEvent, ComplaintRegisterState> {
  ComplaintRegisterBloc({required ComplaintRepository complaintRepository})
      : _complaintRepository = complaintRepository,
        super(ComplaintRegisterInitial()) {
    on<RegisterComplaint>(_onRegisterComplaint);
  }

  final ComplaintRepository _complaintRepository;

  Future<void> _onRegisterComplaint(
    RegisterComplaint event,
    Emitter<ComplaintRegisterState> emit,
  ) async {
    emit(ComplaintRegistering());
    final complaintData = event.complaintData;
    complaintData['images'] = event.images;
    complaintData['id'] = event.id;
    complaintData['userId'] = event.userId;

    final response =
        await _complaintRepository.registerComplaint(complaintData);

    if (response == null) {
      emit(const ComplaintRegisterFailure('Something went wrong!'));
    } else {
      emit(ComplaintRegisterSuccess(response.id));
    }
  }
}
