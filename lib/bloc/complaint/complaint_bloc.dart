import 'dart:async';
import 'dart:developer' as dev;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jcc/models/complaint_stats_model.dart';
import '../../models/complaint_model.dart';
import '../../repositories/complaint_repository.dart';

part 'complaint_event.dart';

part 'complaint_state.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  ComplaintBloc({required ComplaintRepository complaintRepository})
      : _complaintRepository = complaintRepository,
        super(ComplaintInitial()) {
    on<LoadComplaint>(_onLoadComplaint);
    on<UpdateComplaint>(_onUpdateComplaint);
    on<InitializeComplaint>(_onInitializeComplaint);
    on<SolveComplaint>(_onSolveComplaint);
  }

  final ComplaintRepository _complaintRepository;
  StreamSubscription? _complaintSubscription;

  void _onInitializeComplaint(InitializeComplaint event, Emitter<ComplaintState> emit,) {
    _complaintSubscription?.cancel();
    emit(ComplaintInitial());
  }

  FutureOr<void> _onLoadComplaint(
    LoadComplaint event,
    Emitter<ComplaintState> emit,
  ) {
    _complaintSubscription?.cancel();

    try {
      _complaintSubscription =
          _complaintRepository.getComplaints().listen((list) {
        add(UpdateComplaint(list));
      });
    } catch (e) {
      emit(ComplaintError(e.toString()));
    }
  }

  Future<void> _onSolveComplaint(
      SolveComplaint event,
      Emitter<ComplaintState> emit,
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
  }

  FutureOr<void> _onUpdateComplaint(
    UpdateComplaint event,
    Emitter<ComplaintState> emit,
  ) {
    emit(ComplaintLoaded(event.complaintList));
  }

  @override
  void onTransition(Transition<ComplaintEvent, ComplaintState> transition) {
    super.onTransition(transition);
    dev.log(transition.toString(), name: "Complaint List Screen");
  }
}
