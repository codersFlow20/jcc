import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ComplaintSuccess extends StatelessWidget {
  const ComplaintSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/success.json',
            height: 200,
            width: 200,
            repeat: false,
          ),
          Text(
            "Complaint Registred \nSuccessfully",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "You will receive updates related to this \ncomplaint shortly",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Complaint no : 1234567890",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      )),
    );
  }
}
