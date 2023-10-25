import 'package:flutter/material.dart';
import 'package:jcc/common/widget/bottom_navigation_bar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            child,
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: AppBottomNavigationBar(),
            ),
          ],
        ),
      ),
      // floatingActionButton: AppBottomNavigationBar(),
      // bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
