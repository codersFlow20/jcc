import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/common/widget/app_scaffold.dart';
import 'package:jcc/common/widget/scroll_to_hide_widget.dart';
import 'package:jcc/features/auth/screens/auth_screen.dart';
import 'package:jcc/features/complaint/screens/complaint_details.dart';
import 'package:jcc/features/complaint/screens/complaint_list.dart';
import 'package:jcc/features/complaint/screens/complaint_register.dart';
import 'package:jcc/features/complaint/screens/complaint_sucessful.dart';
import 'package:jcc/features/home/screens/home_screen.dart';
import 'package:jcc/features/login/screens/login_screen.dart';
import 'package:jcc/features/login/screens/otp_screen.dart';
import 'package:jcc/features/notification/screens/notification_screen.dart';
import 'package:jcc/features/register/screens/register_screen.dart';
import 'package:jcc/features/user_profile/screens/edit_user_profile.dart';
import 'package:jcc/features/user_profile/screens/user_profile.dart';
import 'package:jcc/models/complaint_model.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _controller = ScrollController();
final _bottomNavKey = GlobalKey<ScrollToHideWidgetState>();

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
      path: '/complaint_successful/:id',
      builder: (context, state) => ComplaintSuccess(
        id: state.pathParameters['id']!,
      ),
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
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/edit_user_profile/:fullName/:email',
      name: 'edit_user_profile',
      builder: (context, state) => EditUserProfile(
        fullName: state.pathParameters['fullName']!,
        email: state.pathParameters['email']!,
      ),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => AppScaffold(
        bottomNavKey: _bottomNavKey,
        controller: _controller,
        child: child,
      ),
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/home',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: HomeScreen(
                controller: _controller,
                bottomNavKey: _bottomNavKey,
              ),
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
              child: ComplaintList(
                controller: _controller,
                bottomNavKey: _bottomNavKey,
              ),
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          },
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: 'complaint_details',
              name: 'complaint_details',
              builder: (context, state) {
                ComplaintModel complaint = state.extra as ComplaintModel;
                return ComplaintDetails(complaint: complaint);
              },
            ),
          ],
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/notifications',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: NotificationScreen(
                controller: _controller,
                bottomNavKey: _bottomNavKey,
              ),
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
