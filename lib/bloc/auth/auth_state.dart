part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthState {
  @override
  String toString() {
    return 'UninitializedState';
  }
}

class Authenticated extends AuthState {
  Authenticated({required this.email});

  final String email;

  @override
  String toString() {
    return 'AuthenticatedState';
  }
}

class UnAuthenticated extends AuthState {
  @override
  String toString() {
    return 'UnAuthenticatedState';
  }
}