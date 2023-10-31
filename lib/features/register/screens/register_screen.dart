import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/bloc/user/register/user_register_bloc.dart';
import 'package:jcc/common/widget/primary_button.dart';
import 'package:jcc/constants/assets_constants.dart';
import 'package:jcc/models/user_model.dart';
import 'package:jcc/theme/colors.dart';

import '../../../bloc/auth/auth_bloc.dart';

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({super.key});

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  final TextEditingController _firstnameController = TextEditingController();

  final TextEditingController _lastnameController = TextEditingController();

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return BlocListener<UserRegisterBloc, UserRegisterState>(
      listener: (context, state) {
        if (state is UserRegistered) {
          context.go('/home');
        } else if (state is UserRegistering) {
          showDialog(
            context: context,
            builder: (context) {
              return const SizedBox(
                width: 50,
                height: 50,
                child: Center(child: CircularProgressIndicator()),
              );
            },
          );
        } else if (state is UserRegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error in registration'),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  AssetsConstants.registerBackground,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 375,
                child: SvgPicture.asset(AssetsConstants.registerArtwork),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildUserInput(
                        context: context,
                        title: "First name",
                        hint: "Enter your first name",
                        controller: _firstnameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildUserInput(
                        context: context,
                        title: "Last name",
                        hint: "Enter your last name",
                        controller: _lastnameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PrimaryButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            final phoneNo =
                                (context.read<AuthBloc>().state as Authenticated)
                                    .phoneNo;
                            final name =
                                '${_firstnameController.text} ${_lastnameController.text}';

                            var user = UserModel(
                              phoneNo: phoneNo,
                              name: name,
                              profilePicUrl: '',
                              notificationToken: phoneNo,
                            );

                            context
                                .read<UserRegisterBloc>()
                                .add(RegisterUser(user));
                          }else {
                            print('Validation not passed!');
                          }
                        },
                        title: "Register",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInput({
    required BuildContext context,
    required String title,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.black60,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          validator: _nameValidator,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  String? _nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return "Name can't be empty!";
    } else if (name.contains(' ')) {
      return "Name can't have spaces!";
    }

    return null;
  }
}
