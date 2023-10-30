part of 'complaint_register_bloc.dart';

abstract class ComplaintRegisterState extends Equatable {
  const ComplaintRegisterState();

  @override
  List<Object> get props => [];
}

class ComplaintRegisterInitial extends ComplaintRegisterState {}

class ComplaintRegistering extends ComplaintRegisterState {}

class ComplaintRegisterSuccess extends ComplaintRegisterState {
  const ComplaintRegisterSuccess(this.id);

  final String id;
}

class ComplaintRegisterFailure extends ComplaintRegisterState {
  const ComplaintRegisterFailure(this.error);

  final String error;
}
