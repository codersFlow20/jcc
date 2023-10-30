import 'package:flutter/material.dart';
import 'package:jcc/theme/colors.dart';

class PrimaryOutlineButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const PrimaryOutlineButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              width: 1.5,
              color: AppColors.darkMidnightBlue,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
