import 'dart:async';
import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jcc/models/complaint_stats_model.dart';
import 'package:jcc/repositories/complaint_repository.dart';

part 'complaint_stats_event.dart';

part 'complaint_stats_state.dart';

class ComplaintStatsBloc
    extends Bloc<ComplaintStatsEvent, ComplaintStatsState> {
  ComplaintStatsBloc({required ComplaintRepository complaintRepository})
      : _complaintRepository = complaintRepository,
        super(ComplaintStatsInitial()) {
    on<GetComplaintStats>(_onGetComplaintStats);
    on<UpdateStats>(_onUpdateStats);
    on<InitializeComplaintStats>(_onInitializeComplaintStats);
  }

  final ComplaintRepository _complaintRepository;
  StreamSubscription? _complaintStatsSubscription;

  void _onInitializeComplaintStats(
    InitializeComplaintStats event,
    Emitter<ComplaintStatsState> emit,
  ) {
    _complaintStatsSubscription?.cancel();
    emit(ComplaintStatsInitial());
  }

  void _onGetComplaintStats(
    GetComplaintStats event,
    Emitter<ComplaintStatsState> emit,
  ) {
    emit(ComplaintStatsLoading());
    try {
      _complaintStatsSubscription?.cancel();
      _complaintStatsSubscription =
          _complaintRepository.getComplaintStats().listen((event) {
        if (event == null) {
          emit(const ComplaintStatsError('Something went wrong!'));
        } else {
          add(UpdateStats(event));
        }
      });
    } catch (e) {
      dev.log('Got error in stats: $e', name: 'Stats');
      emit(ComplaintStatsError(e.toString()));
    }
  }

  void _onUpdateStats(UpdateStats event, Emitter<ComplaintStatsState> emit) {
    emit(ComplaintStatsLoaded(event.complaintStats));
  }

  @override
  void onTransition(
      Transition<ComplaintStatsEvent, ComplaintStatsState> transition) {
    dev.log(transition.toString(), name: 'Stats');
    super.onTransition(transition);
  }
}
