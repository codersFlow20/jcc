part of 'selected_complaint_bloc.dart';

abstract class SelectedComplaintEvent extends Equatable {
  const SelectedComplaintEvent();

  @override
  List<Object?> get props => [];
}

class InitializeSelectedComplaint extends SelectedComplaintEvent {}

class LoadSelectedComplaint extends SelectedComplaintEvent {
  const LoadSelectedComplaint(this.id);

  final String id;
}

class SolveComplaint extends SelectedComplaintEvent {
  const SolveComplaint({required this.complaint, required this.stats});

  final ComplaintModel complaint;
  final ComplaintStatsModel stats;
}

class UpdateSelectedComplaint extends SelectedComplaintEvent {
  const UpdateSelectedComplaint(this.complaint);

  final ComplaintModel complaint;
}
