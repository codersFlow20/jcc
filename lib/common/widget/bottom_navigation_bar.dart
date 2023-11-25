// this file created by jay pedhadiya

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/constants/assets_constants.dart';
import 'package:jcc/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBottomNavigationBar extends StatelessWidget {
  AppBottomNavigationBar({super.key});

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
    SvgPicture.asset(
      AssetsConstants.home,
      colorFilter: const ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
    ),
    SvgPicture.asset(
      AssetsConstants.complaints,
      colorFilter: const ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
    ),
    SvgPicture.asset(
      AssetsConstants.notifications,
      colorFilter: const ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: 0.5,
            offset: const Offset(0, 0),
          ),
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
          unselectedLabelStyle: Theme.of(context).textTheme.titleLarge,
          selectedLabelStyle: Theme.of(context).textTheme.headlineSmall,
          currentIndex: _calculateSelectedIndex(context),
          onTap: (value) => onTap(value, context),
          items: [
            _buildBottomNavigationBarItem(index: 0,label: AppLocalizations.of(context)!.homeTitle),
            _buildBottomNavigationBarItem(index: 1,label: AppLocalizations.of(context)!.complaints),
            _buildBottomNavigationBarItem(index: 2,label: AppLocalizations.of(context)!.notification),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({required int index,required String label}) {
    return BottomNavigationBarItem(
      icon: outlinedIcon[index],
      activeIcon: filledIcons[index],
      label: label,
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final GoRouterState router = GoRouterState.of(context);
    final String location = router.matchedLocation;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/complaints')) {
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
        return context.go('/complaints');
      case 2:
        return context.go('/notifications');
      default:
        return context.go('/home');
    }
  }
}
