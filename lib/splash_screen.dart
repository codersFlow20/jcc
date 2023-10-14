
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Timer(Duration(seconds: 2), () {
    //   context.go('/login');
    // });
    Future.delayed(
      Duration(seconds: 3),
      () {
            context.go('/login');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogo();
  }
}
