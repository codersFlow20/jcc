import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcc/bloc/auth/auth_bloc.dart';
import 'package:jcc/bloc/complaint/complaint_bloc.dart';
import 'package:jcc/bloc/login/login_bloc.dart';
import 'package:jcc/bloc/user/register/user_register_bloc.dart';
import 'package:jcc/config/router.dart';
import 'package:jcc/firebase_options.dart';
import 'package:jcc/repositories/auth/auth_repository.dart';
import 'package:jcc/repositories/complaint_repository.dart';
import 'package:jcc/repositories/user_repository.dart';
import 'package:jcc/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final complaintRepository = ComplaintRepository();
    final userRepository = UserRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(authRepository: AuthRepository())..add(AppStarted()),
        ),
        BlocProvider(
          create: (context) => LogInBloc(authRepository: AuthRepository()),
        ),
        BlocProvider(
          create: (context) =>
              ComplaintBloc(complaintRepository: complaintRepository)
                ..add(LoadComplaint()),
        ),
        BlocProvider(
          create: (context) => UserRegisterBloc(userRepository: userRepository),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        routerConfig: router,
      ),
    );
  }
}
