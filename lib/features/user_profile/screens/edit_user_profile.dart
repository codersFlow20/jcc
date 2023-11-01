import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/common/widget/primary_button.dart';
import 'package:jcc/constants/string_constants.dart';
import 'package:jcc/generated/assets.dart';
import 'package:jcc/theme/colors.dart';
import 'dart:developer' as dev;

class EditUserProfile extends StatefulWidget {
  final String email;
  final String fullName;
  const EditUserProfile(
      {super.key, required this.fullName, required this.email});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _firstNameController.text = widget.fullName.substring(0, widget.fullName.indexOf(' '));
    _lastNameController.text = widget.fullName.substring(widget.fullName.indexOf(' ')+1);
    _emailController.text = widget.email;
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(
            Assets.iconsBackArrow,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          CommonDataConstants.editUserProfile,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 22,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: SvgPicture.asset(
                Assets.backgroundsUserProfileBackground,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'profile',
                      child: Container(
                        height: 180,
                        width: 260,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              Assets.imageProfileImage,
                            ),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5,right: 5),
                                  child: IconButton(
                                    onPressed: () {
                                      dev.log("Pressed");
                                    },
                                    icon: SvgPicture.asset(
                                      Assets.iconsAddImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        _buildTextField(
                          context: context,
                          label: ScreensDataConstants.firstName,
                          data: widget.fullName,
                          controller: _firstNameController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        _buildTextField(
                          context: context,
                          label: ScreensDataConstants.lastName,
                          data: widget.fullName,
                          controller: _lastNameController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        _buildTextField(
                          context: context,
                          label: ScreensDataConstants.email,
                          data: widget.email,
                          controller: _emailController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        PrimaryButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              dev.log('Validation passed!');
                              final firstName = _firstNameController.text;
                              final lastName = _lastNameController.text;
                              final email = _emailController.text;

                              dev.log("$firstName $lastName, $email");
                            } else {
                              dev.log('Validation not passed!');
                            }
                          },
                          title: CommonDataConstants.save,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String label,
    required String data,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.5,
                color: AppColors.black60,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
          ),
          validator: (value) => label == ScreensDataConstants.email
              ? _emailValidator(value)
              :_nameValidator(value),
        ),
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

  String? _emailValidator(String? email) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);
    if (email == null || email.isEmpty) {
      return "Email can't be empty!";
    } else if (!regex.hasMatch(email)) {
      return "Enter a valid email address";
    }
    return null;
  }
}


