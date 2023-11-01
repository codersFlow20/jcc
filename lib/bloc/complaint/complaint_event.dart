part of 'complaint_bloc.dart';

abstract class ComplaintEvent extends Equatable {
  const ComplaintEvent();

  @override
  List<Object?> get props => [];
}

class InitializeComplaint extends ComplaintEvent {}

class LoadComplaint extends ComplaintEvent {}

class UpdateComplaint extends ComplaintEvent {
  const UpdateComplaint(this.complaintList);

  final List<ComplaintModel> complaintList;
}
