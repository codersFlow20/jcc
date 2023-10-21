// this file created by jay pedhadiya

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/constants/assets_constants.dart';
import 'package:jcc/constants/string_constants.dart';
import 'package:jcc/theme/colors.dart';
import 'package:jcc/theme/texts.dart';

class AppBottomNavigationBar extends StatelessWidget {
  AppBottomNavigationBar({super.key, required this.child});

  final Widget child;

  final outlinedIcon = [
    SvgPicture.asset(
      AssetsConstants.home,
      colorFilter: const ColorFilter.mode(AppColors.black60, BlendMode.srcIn),
    ),
    SvgPicture.asset(
      AssetsConstants.complaints,
      colorFilter: const ColorFilter.mode(AppColors.black60, BlendMode.srcIn),
    ),
    SvgPicture.asset(
      AssetsConstants.notifications,
      colorFilter: const ColorFilter.mode(AppColors.black60, BlendMode.srcIn),
    ),
  ];

  final filledIcons = [
    SvgPicture.asset(AssetsConstants.home,
        colorFilter: const ColorFilter.mode(AppColors.blue, BlendMode.srcIn)),
    SvgPicture.asset(AssetsConstants.complaints,
        colorFilter: const ColorFilter.mode(AppColors.blue, BlendMode.srcIn)),
    SvgPicture.asset(AssetsConstants.notifications,
        colorFilter: const ColorFilter.mode(AppColors.blue, BlendMode.srcIn)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 30,
                spreadRadius: 0.5,
                offset: const Offset(0, 2))
          ],
        ),
        height: 75,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            backgroundColor: AppColors.antiFlashWhite,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.blue,
            unselectedItemColor: AppColors.black60,
            showUnselectedLabels: true,
            unselectedLabelStyle: AppTexts.titleMedium,
            selectedLabelStyle: AppTexts.titleSmall,
            currentIndex: _calculateSelectedIndex(context),
            onTap: (value) => onTap(value, context),
            items: [
              _buildBottomNavigationBarItem(index: 0),
              _buildBottomNavigationBarItem(index: 1),
              _buildBottomNavigationBarItem(index: 2)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({required int index}) {
    return BottomNavigationBarItem(
      icon: outlinedIcon[index],
      activeIcon: filledIcons[index],
      label: UserDataConstants.bottomNavigation[index],
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final GoRouterState router = GoRouterState.of(context);
    final String location = router.matchedLocation;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/Complaints')) {
      return 1;
    }
    if (location.startsWith('/notifications')) {
      return 2;
    }
    return 0;
  }

  void onTap(int value, BuildContext context) {
    switch (value) {
      case 0:
        return context.go('/home');
      case 1:
        return context.go('/Complaints');
      case 2:
        return context.go('/notifications');
      default:
        return context.go('/home');
    }
  }
}
