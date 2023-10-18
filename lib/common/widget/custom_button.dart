import 'package:flutter/material.dart';
import 'package:jcc/utils/constant.dart';

class MyButton extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  const MyButton({super.key, required this.onTap, required this.title});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstants.darkMiddleBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
