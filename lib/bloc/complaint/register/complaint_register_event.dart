part of 'complaint_register_bloc.dart';

abstract class ComplaintRegisterEvent extends Equatable {
  const ComplaintRegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterComplaint extends ComplaintRegisterEvent {
  const RegisterComplaint({
    required this.id,
    required this.complaintData,
    required this.images,
    required this.userId,
  });

  final String id;
  final String userId;
  final Map<String, dynamic> complaintData;
  final List<File> images;
}
