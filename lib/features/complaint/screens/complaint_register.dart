import 'dart:io';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jcc/bloc/complaint/complaint_register_form/complaint_register_form_bloc.dart';
import 'package:jcc/bloc/complaint/register/complaint_register_bloc.dart';
import 'package:jcc/bloc/user/register/user_register_bloc.dart';
import 'package:jcc/common/widget/primary_button.dart';
import 'package:jcc/constants/assets_constants.dart';
import 'package:jcc/generated/assets.dart';
import 'package:jcc/theme/colors.dart';
import 'package:jcc/utils/ui_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../bloc/complaint/stats/complaint_stats_bloc.dart';

class ComplaintRegistrationScreen extends StatefulWidget {
  const ComplaintRegistrationScreen({super.key});

  @override
  State<ComplaintRegistrationScreen> createState() =>
      _ComplaintRegistrationScreenState();
}

class _ComplaintRegistrationScreenState
    extends State<ComplaintRegistrationScreen> {
  final images = <File>[];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.complaintRegister,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: BlocProvider(
        create: (context) => ComplaintRegisterFormBloc(),
        child: Builder(
          builder: (context) {
            final registerBloc = context.read<ComplaintRegisterFormBloc>();

            return FormBlocListener<ComplaintRegisterFormBloc,
                Map<String, dynamic>, String>(
              onSubmitting: (context, state) {},
              onSuccess: (context, state) {
                dev.log(
                  'Registering complaint: ${state.successResponse}',
                  name: 'Complaint',
                );

                final complaintData = state.successResponse!;

                final statsState = context.read<ComplaintStatsBloc>().state;
                if (statsState is ComplaintStatsLoaded) {
                  final id = (statsState.stats.total + 1).toString();
                  complaintData['registerCount'] = statsState.stats.registered + 1;

                  final user =
                      (context.read<UserRegisterBloc>().state as UserRegistered)
                          .user;

                  context.read<ComplaintRegisterBloc>().add(
                        RegisterComplaint(
                          id: id,
                          complaintData: complaintData,
                          images: images,
                          userId: user.phoneNo,
                          userName: user.name,
                        ),
                      );
                } else {}
              },
              child:
                  BlocListener<ComplaintRegisterBloc, ComplaintRegisterState>(
                listener: (context, state) {
                  if (state is ComplaintRegistering) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Row(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Registering complaint..."),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is ComplaintRegisterSuccess) {
                    context.push('/complaint_successful/${state.id}');
                  } else if (state is ComplaintRegisterFailure) {
                    UIUtils.showSnackBar(
                      context: context,
                      message: 'Something went wrong! Please try again!',
                    );
                  }
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.whatIsYourProblem,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: AppColors.black60,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        _buildDropdownField(
                          hint: '-- ${AppLocalizations.of(context)!.selectDepartment} --',
                          bloc: registerBloc.department,
                          label: AppLocalizations.of(context)!.department,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        _buildDropdownField(
                          hint: '-- ${AppLocalizations.of(context)!.selectSubject} --',
                          bloc: registerBloc.subject,
                          label: AppLocalizations.of(context)!.subject,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        _buildTextField(
                          label: AppLocalizations.of(context)!.description,
                          bloc: registerBloc.description,
                          hint: AppLocalizations.of(context)!.descriptionOfProblem,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          AppLocalizations.of(context)!.whereIsTheProblem,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: AppColors.black60,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        _buildDropdownField(
                          hint: '-- ${AppLocalizations.of(context)!.selectWard} --',
                          bloc: registerBloc.wardNo,
                          label: AppLocalizations.of(context)!.wardNo,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        _buildDropdownField(
                          hint: '-- ${AppLocalizations.of(context)!.selectArea} --',
                          bloc: registerBloc.area,
                          label: AppLocalizations.of(context)!.area,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        _buildTextField(
                          label: AppLocalizations.of(context)!.detailedAddress,
                          bloc: registerBloc.detailedAddress,
                          hint: AppLocalizations.of(context)!.detailedAddressHint,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        _buildUploadImagesSection(context),
                        const SizedBox(
                          height: 15,
                        ),
                        PrimaryButton(
                          onTap: registerBloc.submit,

                          // onTap: images.isNotEmpty
                          //     ? registerBloc.submit
                          //     : showDialog(
                          //         context: context,
                          //         builder: (BuildContext context) {
                          //           return Dialog(
                          //             backgroundColor: AppColors.white,
                          //             child: SizedBox(
                          //               height: 141,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(20.0),
                          //                 child: Column(
                          //                   children: [
                          //                     Text(
                          //                       "You have to at least add one Image in order to Register Complaint",
                          //                       style: Theme.of(context)
                          //                           .textTheme
                          //                           .headlineSmall
                          //                           ?.copyWith(
                          //                             color: AppColors.red,
                          //                           ),
                          //                     ),
                          //                     const SizedBox(
                          //                       height: 15,
                          //                     ),
                          //                     ElevatedButton(
                          //                       onPressed: () {
                          //                         context.pop();
                          //                       },
                          //                       child: SizedBox(
                          //                         width: double.infinity,
                          //                         child: Center(
                          //                           child: Text(
                          //                             "Ok",
                          //                             style: Theme.of(context)
                          //                                 .textTheme
                          //                                 .headlineLarge
                          //                                 ?.copyWith(
                          //                                   fontWeight:
                          //                                       FontWeight.w600,
                          //                                   color: AppColors
                          //                                       .darkMidnightBlue,
                          //                                 ),
                          //                           ),
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           );
                          //         },
                          //       ),
                          title: AppLocalizations.of(context)!.complaintRegister,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildUploadImagesSection(BuildContext scaffoldContext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.uploadPhoto,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: images.length < 3 ? images.length + 1 : images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 187.5,
                height: 250,
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.black25,
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(0.0, 0.0), // shadow direction: bottom right
                    ),
                  ],
                  color: AppColors.antiFlashWhite,
                  image: (index < images.length)
                      ? DecorationImage(
                          image: FileImage(
                            images[index],
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Center(
                  child: Stack(
                    children: [
                      if (index < images.length)
                        Positioned(
                          top: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                images.removeAt(index);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.black25),
                              child: SvgPicture.asset(
                                AssetsConstants.deleteBg,
                                fit: BoxFit.cover,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (index == images.length)
                        Center(
                          child: IconButton(
                            onPressed: () {
                              getImage(
                                scaffoldContext: scaffoldContext,
                                index: index < images.length ? index : null,
                              );
                            },
                            icon: SvgPicture.asset(
                              width: 40,
                              height: 40,
                              Assets.iconsCircleAdd,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required SelectFieldBloc bloc,
    required String hint,
    required String label,
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
        DropdownFieldBlocBuilder(
          selectFieldBloc: bloc,
          textOverflow: TextOverflow.ellipsis,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.black60,
                ),
          ),
          itemBuilder: (context, value) {
            return FieldItem(child: Text(value.toString()));
          },
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextFieldBloc bloc,
    required String hint,
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
        TextFieldBlocBuilder(
          textFieldBloc: bloc,
          minLines: 2,
          maxLines: 10,
          textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontFamily: 'Roboto',
              ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.black60,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
          ),
        ),
      ],
    );
  }

  Future getImage({required BuildContext scaffoldContext, int? index}) async {
    showBottomSheet(
      context: scaffoldContext,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AssetsConstants.edge),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Choose Option',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      context.pop();
                      getImageFromSource(source: ImageSource.camera);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AssetsConstants.cameraBg,
                          width: 50,
                        ),
                        const Text('Camera'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      context.pop();
                      getImageFromSource(source: ImageSource.gallery);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AssetsConstants.galleryBg,
                          width: 50,
                        ),
                        const Text('Gallery'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Dismiss'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImageFromSource({required ImageSource source, int? index}) async {
    dev.log('Index: $index | images size: ${images.length}', name: 'Image');
    final pickedFile = await picker.pickImage(source: source);
    XFile? xFilePick = pickedFile;

    if (xFilePick != null) {
      final file = File(pickedFile!.path);

      setState(() {
        if (index != null) {
          images[index] = file;
        } else {
          images.add(file);
        }
      },
      );
    } else {
      UIUtils.showSnackBar(context: context, message: 'Nothing is selected');
    }
  }
}
