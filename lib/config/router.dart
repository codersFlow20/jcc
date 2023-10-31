import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/common/widget/app_scaffold.dart';
import 'package:jcc/features/auth/screens/auth_screen.dart';
import 'package:jcc/features/complaint/screens/complaint_list.dart';
import 'package:jcc/features/complaint/screens/complaint_register.dart';
import 'package:jcc/features/home/screens/home_screen.dart';
import 'package:jcc/features/login/screens/login_screen.dart';
import 'package:jcc/features/login/screens/otp_screen.dart';
import 'package:jcc/features/notification/screens/notification_screen.dart';
import 'package:jcc/features/register/screens/register_screen.dart';
import 'package:jcc/features/user_profile/screens/user_profile.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/auth',
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
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
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/complaint_register',
      builder: (context, state) => const ComplaintRegistrationScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/user_register',
      builder: (context, state) => const UserRegisterScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/user_profile',
      builder: (context, state) => const UserProfile(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/home',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const HomeScreen(),
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/complaints',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const ComplaintList(),
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/notifications',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const NotificationScreen(),
              transitionDuration: Duration.zero,
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return child;
              },
            );
          },
        ),
      ],
    ),
  ],
);
