part of 'selected_complaint_bloc.dart';

abstract class SelectedComplaintState extends Equatable {
  const SelectedComplaintState();

  @override
  List<Object> get props => [];
}

class SelectedComplaintInitial extends SelectedComplaintState {

}

class SelectedComplaintLoading extends SelectedComplaintState {}

class SelectedComplaintLoaded extends SelectedComplaintState {
  const SelectedComplaintLoaded(this.complaint);

  final ComplaintModel complaint;

  @override
  List<Object> get props => [complaint];
}

class SelectedComplaintError extends SelectedComplaintState {
  const SelectedComplaintError(this.message);

  final String message;
}
