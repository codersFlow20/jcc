part of 'complaint_bloc.dart';

abstract class ComplaintState extends Equatable {
  const ComplaintState();

  @override
  List<Object> get props => [];
}

class ComplaintInitial extends ComplaintState {}

class ComplaintLoading extends ComplaintState {}

class ComplaintLoaded extends ComplaintState {
  const ComplaintLoaded(this.complaintList);

  final List<ComplaintModel> complaintList;

  @override
  List<Object> get props => [complaintList];
}

class ComplaintError extends ComplaintState{
  final String message;
  const ComplaintError(this.message);

  @override
  List<Object> get props => [message];

}