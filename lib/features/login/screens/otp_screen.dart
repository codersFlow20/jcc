// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer' as dev;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/bloc/login/login_bloc.dart';
import 'package:jcc/theme/colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = "";
  String verificationId = "";
  TextEditingController _otpController = TextEditingController();

  late LogInBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LogInBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/backgrounds/opt_background.svg",
            width: MediaQuery.of(context).size.width,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Expanded(child: SizedBox()),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30.0),
                    right: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 20.0),
                      child: Text(
                        "we have sent an OTP to your mobile number",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: _otpController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Enter OTP",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.darkMidnightBlue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.darkMidnightBlue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.darkMidnightBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    BlocConsumer<LogInBloc, LogInState>(
                      bloc: _loginBloc,
                      listener: (context, state) {
                        if (state.isOtpVerified) {
                          context.go('/home');
                        } else if (state.isOtpError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Something went wrong ${state.error.toString()}",
                              ),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return InkWell(
                          onTap: () async {
                            FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                            dev.log("OTP: $otp", name: "OTP");
                            dev.log("VerificationId: ${state.verificationId}",
                                name: "OTP");
                            try {
                              final AuthCredential credential =
                                  PhoneAuthProvider.credential(
                                verificationId: state.verificationId.toString(),
                                smsCode: _otpController.text,
                              );
                              dev.log("Hello", name: "OTP");
                              await _firebaseAuth
                                  .signInWithCredential(credential);
                              context.go("/home");
                            } catch (e) {
                              rethrow;
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.darkMidnightBlue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
