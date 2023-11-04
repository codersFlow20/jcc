// TODO : Editor : Bhavy Ukani

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/bloc/login/login_bloc.dart';
import 'package:jcc/theme/colors.dart';
import 'package:jcc/utils/validators.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/user/register/user_register_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileNoController = TextEditingController();

  late LogInBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LogInBloc>(context);
    // _mobileNoController.addListener(_onPhoneChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocListener<LogInBloc, LogInState>(
        listener: (context, state) {
          if (state.isOtpSent) {
            context.go('/otpScreen', extra: {'verificationId':state.verificationId ?? ""});
            print(state.verificationId);
          } else if (state.isOtpError) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Something went wrong ${state.error.toString()}",
                ),
              ),
            );
          } else if (state.isSubmitting) {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                content: Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 20,),
                    Text("Sending OTP"),
                  ],
                ),
              );
            },);
          } else if (state.isOtpVerified) {
            context.read<AuthBloc>().add(LoggedIn());
            Future.delayed(const Duration(seconds: 0), () {
              final phoneNo = (context.read<AuthBloc>().state as Authenticated).phoneNo;
              context.read<UserRegisterBloc>().add(GetUser(phoneNo));
            },);
          }
        },
        child: BlocBuilder<LogInBloc, LogInState>(
          bloc: _loginBloc,
          builder: (context, state) {
            return SafeArea(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/backgrounds/login_background.svg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.loginLable,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          cursorColor: Colors.black,
                          controller: _mobileNoController,
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Text(
                              "  +91 | ",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        //Container button with blue color and text as login with 70px height
                        InkWell(
                          onTap: _onLoginPressed,
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.darkMidnightBlue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Continue",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onLoginPressed() {
    if (Validators.isValidMobileNo(_mobileNoController.text)) {
      _loginBloc.add(SendOtpPressed(phoneNumber: _mobileNoController.text));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please enter valid mobile no",
          ),
        ),
      );
    }
  }
}
