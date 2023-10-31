import 'package:flutter/material.dart';
import 'package:jcc/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const PrimaryButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.darkMidnightBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
