part of 'complaint_register_bloc.dart';

abstract class ComplaintRegisterEvent extends Equatable {
  const ComplaintRegisterEvent();

  @override
  List<Object> get props => [];
}


class ComplaintRegister extends ComplaintRegisterEvent{
  const ComplaintRegister(this.complaintData);

  final Map<String, dynamic> complaintData;
}