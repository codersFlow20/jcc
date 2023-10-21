import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 1500),
      () {
        context.go('/auth');
      },
    );
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/icons/logo.png'),
      ),
    );
  }
}
