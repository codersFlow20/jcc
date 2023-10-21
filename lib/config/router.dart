import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/common/widget/bottom_navigation_bar.dart';
import 'package:jcc/features/auth/screens/auth_screen.dart';
import 'package:jcc/features/complaint/screens/complaint_list.dart';
import 'package:jcc/features/home/screens/home_screen.dart';
import 'package:jcc/features/login/screens/login_screen.dart';
import 'package:jcc/features/login/screens/otp_screen.dart';
import 'package:jcc/features/notification/screens/notification_screen.dart';
import 'package:jcc/features/register/register/register_screen.dart';
import 'package:jcc/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKay = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/registration',
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
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
      path: '/registration',
      builder: (context, state) => const RegistrationScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/otpScreen',
      builder: (context, state) => const OtpScreen(),
    ),
    ShellRoute(
        navigatorKey: _shellNavigatorKay,
        builder: (context, state, child) =>
            AppBottomNavigationBar(child: child),
        routes: [
          GoRoute(
              parentNavigatorKey: _shellNavigatorKay,
              path: '/home',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                    child: const HomeScreen(),
                    transitionDuration: Duration.zero,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    });
              }),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKay,
              path: '/Complaints',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                    child: const ComplaintList(),
                    transitionDuration: Duration.zero,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    });
              }),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKay,
              path: '/notifications',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                    child: const NotificationScreen(),
                    transitionDuration: Duration.zero,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    });
              }),
        ]),
  ],
);
