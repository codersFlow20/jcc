import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/bloc/auth/auth_bloc.dart';
import 'package:jcc/bloc/user/register/user_register_bloc.dart';

import '../../../generated/assets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Uninitialized) {
              dev.log('Uninitialized State', name: 'AuthState');
            } else if (state is UnAuthenticated) {
              context.go('/login');
            } else if (state is Authenticated) {
              // dev.log('Authenticated state in AuthScreen, Going home screen');
              // context.go('/home');
              context.read<UserRegisterBloc>().add(GetUser(state.phoneNo));
            } else {
              dev.log('Unknown state', name: 'AuthState');
              context.go('/login');
            }
          },
        ),
        BlocListener<UserRegisterBloc, UserRegisterState>(
          listener: (context, state) {
            if (state is UserRegistered) {
              context.go('/home');
            }else if (state is UserNotRegistered) {
              context.go('/user_register');
            }else if (state is UserError) {
              context.read<AuthBloc>().add(LoggedOut());
            }
          },
        ),
      ],
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Image.asset(Assets.iconsLogo),
              const SizedBox(
                height: 5,
              ),
              const CircularProgressIndicator(),
              const Text('Please wait'),
            ],
          ),
        ),
      ),
    );
  }
}
