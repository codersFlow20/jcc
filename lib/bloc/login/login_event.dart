part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPressed extends LoginEvent {
  final String phone;

  const LoginPressed({required this.phone});

  @override
  List<Object> get props => [phone];

  @override
  String toString() => 'LoginPressed { phone: $phone }';
}

class LoginOtpSubmitted extends LoginEvent {
  final String verificationId;
  final String smsCode;

  const LoginOtpSubmitted({required this.verificationId, required this.smsCode});

  @override
  List<Object> get props => [verificationId, smsCode];

  @override
  String toString() => 'LoginOtpSubmitted { verificationId: $verificationId, smsCode: $smsCode }';
}

