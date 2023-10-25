import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcc/bloc/user/register/user_register_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // var name = (context
    //     .read<UserRegisterBloc>()
    //     .state as UserRegistered).user.name;

    return BlocBuilder<UserRegisterBloc, UserRegisterState>(
      builder: (context, state) {
        if (state is UserRegistered) {
          var name = state.user.name;

          return Scaffold(
            body: Text('Name: $name'),
            backgroundColor: Colors.blue,
          );
        }

        return Scaffold(
          body: Text('Home Screen'),
          backgroundColor: Colors.blue,
        );
      },
    );
  }
}
