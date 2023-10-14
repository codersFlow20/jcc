import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jcc/bloc/login/login_bloc.dart';
import 'package:jcc/repositories/auth/auth_repository.dart';
import 'package:jcc/utils/validators.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.empty()) {
    on<LoginPressed>(_onLoginPressed);
    on<LoginOtpSubmitted>(_onOtpSubmitted);
  }

  final AuthRepository _authRepository;

  void onPhoneChanged(String phone) {
    emit(state.update(phone: phone));
  }


  Future<void> _onLoginPressed(LoginPressed event,
      Emitter<LoginState> emit) async {
    try {
      _authRepository.signInWithPhoneNumber(
          event.phone, (verifactioId, resendToken) {
        emit(state.update(otpSent: true, verifactioId: verifactioId));
      });
    } catch (e) {
      print("$e================================");
      emit(LoginState.failure(error: e.toString()));
    }
  }

  Future<void> _onOtpSubmitted(LoginOtpSubmitted event,
      Emitter<LoginState> emit) async {
    try {
      final userCredential = await _authRepository.signInWithOTP(
          event.verificationId, event.smsCode);
      emit(LoginState.success());
    } catch (e) {
      emit(LoginState.failure(error: e.toString()));
    }
  }
}
