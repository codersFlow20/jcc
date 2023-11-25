import 'dart:async';
import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/complaint_model.dart';
import '../../../models/complaint_stats_model.dart';
import '../../../repositories/complaint_repository.dart';
import '../../../repositories/notification_repository.dart';

part 'selected_complaint_event.dart';

part 'selected_complaint_state.dart';

class SelectedComplaintBloc
    extends Bloc<SelectedComplaintEvent, SelectedComplaintState> {
  SelectedComplaintBloc({
    required ComplaintRepository complaintRepository,
    required NotificationRepository notificationRepository,
  })  : _complaintRepository = complaintRepository,
        _notificationRepository = notificationRepository,
        super(SelectedComplaintInitial()) {
    on<InitializeSelectedComplaint>(_onInitializeSelectedComplaint);
    on<LoadSelectedComplaint>(_onLoadSelectedComplaint);
    on<SolveComplaint>(_onSolveComplaint);
    on<UpdateSelectedComplaint>(_onUpdateSelectedComplaint);
  }

  final ComplaintRepository _complaintRepository;
  final NotificationRepository _notificationRepository;
  StreamSubscription? _selectedComplaintSubscription;

  void _onInitializeSelectedComplaint(
    InitializeSelectedComplaint event,
    Emitter<SelectedComplaintState> emit,
  ) {
    _selectedComplaintSubscription?.cancel();
    emit(SelectedComplaintInitial());
  }

  void _onLoadSelectedComplaint(
    LoadSelectedComplaint event,
    Emitter<SelectedComplaintState> emit,
  ) {
    emit(SelectedComplaintLoading());
    _selectedComplaintSubscription?.cancel();
    try {
      _selectedComplaintSubscription = _complaintRepository
          .getSelectedComplaint(event.id)
          .listen((complaint) {
        if (complaint == null) {
          emit(const SelectedComplaintError('Not found'));
        } else {
          add(UpdateSelectedComplaint(complaint));
        }
      });
    } catch (e) {
      emit(SelectedComplaintError(e.toString()));
    }
  }

  Future<void> _onSolveComplaint(
    SolveComplaint event,
    Emitter<SelectedComplaintState> emit,
  ) async {
    final time = DateTime.now();
    final complaint = event.complaint;

    final updatedTrackData = complaint.trackData
      ..add(
        TimeLine(
          date: time.toString(),
          status: 'Solved',
        ),
      );

    final updateData = {
      'status': 'Solved',
      'trackData': updatedTrackData.map((e) => e.toMap()),
    };

    await _complaintRepository.updateComplaint(complaint.id, updateData);
    await _complaintRepository.updateComplaintStats({
      'in_process': (event.stats.inProcess - 1).toString(),
      'solved': (event.stats.solved + 1).toString(),
    });

    final email = await _complaintRepository.getEmployeeEmail(
      complaint.assignedEmployeeId,
    );

    await _notificationRepository.sendPushNotification(
      'Complaint no. ${complaint.id} is marked as Solved!',
      'Approval Granted',
      [email],
    );
  }

  void _onUpdateSelectedComplaint(
    UpdateSelectedComplaint event,
    Emitter<SelectedComplaintState> emit,
  ) {
    emit(SelectedComplaintLoaded(event.complaint));
  }

  @override
  void onTransition(
      Transition<SelectedComplaintEvent, SelectedComplaintState> transition) {
    dev.log(transition.toString(), name: 'SelectedComplaint');
    super.onTransition(transition);
  }
}
