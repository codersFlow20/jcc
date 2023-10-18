import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/bloc/auth/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Uninitialized) {
          dev.log('Uninitialized State', name: 'AuthState');
        } else if (state is UnAuthenticated) {
          context.go('/login');
        } else if (state is Authenticated) {
          dev.log('Authenticated state in AuthScreen, Going home screen');
          context.go('/home');
        } else {
          dev.log('Unknown state', name: 'AuthState');
          context.go('/login');
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
