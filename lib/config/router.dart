import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/features/auth/screens/auth_screen.dart';
import 'package:jcc/features/home/screens/home_screen.dart';
import 'package:jcc/features/login/screens/login_screen.dart';
import 'package:jcc/features/login/screens/otp_screen.dart';
import 'package:jcc/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/splash',
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/otpScreen',
      builder: (context, state) => const OtpScreen(),
    )
  ],
);
