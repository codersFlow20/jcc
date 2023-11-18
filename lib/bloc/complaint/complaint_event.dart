part of 'complaint_bloc.dart';

abstract class ComplaintEvent extends Equatable {
  const ComplaintEvent();

  @override
  List<Object?> get props => [];
}

class InitializeComplaint extends ComplaintEvent {}

class LoadComplaint extends ComplaintEvent {}

class SolveComplaint extends ComplaintEvent {
  const SolveComplaint({required this.complaint, required this.stats});

  final ComplaintModel complaint;
  final ComplaintStatsModel stats;
}

class UpdateComplaint extends ComplaintEvent {
  const UpdateComplaint(this.complaintList);

  final List<ComplaintModel> complaintList;
}
