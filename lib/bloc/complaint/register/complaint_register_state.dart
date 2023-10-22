part of 'complaint_register_bloc.dart';

abstract class ComplaintRegisterState extends Equatable {
  const ComplaintRegisterState();

  @override
  List<Object> get props => [];
}

class ComplaintRegisterInitial extends ComplaintRegisterState {}

class ComplaintSubmitting extends ComplaintRegisterState {}

class ComplaintRegisterSuccess extends ComplaintRegisterState {}

class ComplaintRegisterFailure extends ComplaintRegisterState {
  const ComplaintRegisterFailure(this.error);

  final String error;
}
