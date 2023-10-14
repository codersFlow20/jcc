part of 'login_bloc.dart';

class LoginState {
  final String phone;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String? error;
  final bool otpSent;
  final String? verifactionId;

  bool get isFormValid => Validators.isValidMobileNo(phone);

  LoginState({
    required this.phone,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    this.error,
    required this.otpSent,
    this.verifactionId,
  });

  factory LoginState.empty() {
    return LoginState(
      phone: '',
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      otpSent: false,
    );
  }

  factory LoginState.loading() {
    return LoginState(
      phone: '',
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      otpSent: false,
    );
  }

  factory LoginState.failure({String? error}) {
    return LoginState(
      phone: '',
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      error: error,
      otpSent: false,
    );
  }

  factory LoginState.success() {
    return LoginState(
      phone: '',
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      otpSent: false,
    );
  }

  LoginState update({
    String? phone,
    bool? otpSent,
    String? verifactioId,
  }) {
    return copyWith(
      phone: phone,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      otpSent: otpSent,
      verifactionId: verifactioId,
    );
  }

  LoginState copyWith({
    String? phone,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    String? error,
    bool? otpSent,
    String? verifactionId,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      error: error,
      otpSent: otpSent ?? this.otpSent,
      verifactionId: verifactionId ?? this.verifactionId,
    );
  }

  @override
  String toString() {
    return '''LoginState {
      phone: $phone,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      error: $error,
      otpSent: $otpSent,
      verifactionId: $verifactionId,
    }''';
  }
}
