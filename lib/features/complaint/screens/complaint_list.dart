import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/constants/string_constants.dart';
import 'package:jcc/theme/colors.dart';
import 'package:lottie/lottie.dart';
import '../../../bloc/complaint/complaint_bloc.dart';
import '../../../common/widget/primary_button.dart';
import '../../../constants/assets_constants.dart';
import '../../../models/complaint_model.dart';
import '../widgets/complaint_widget.dart';
import 'package:jcc/common/widget/menu_drawer.dart';
import 'package:jcc/generated/assets.dart';
import '../../../common/widget/scroll_to_hide_widget.dart';
import 'dart:developer' as dev;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ComplaintList extends StatefulWidget {
  const ComplaintList({
    super.key,
    required this.controller,
    required this.bottomNavKey,
  });

  final ScrollController controller;
  final GlobalKey<ScrollToHideWidgetState> bottomNavKey;

  @override
  State<ComplaintList> createState() => _ComplaintListState();
}

class _ComplaintListState extends State<ComplaintList> {
  List<ComplaintModel> originalList = [];
  List<ComplaintModel> filteredList = [];
  String statusValue = "All";
  String sortValue = 'Newest';
  String departmentValue = "All";

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 85,
        ),
        child: FloatingActionButton.extended(
          label: Text(
            AppLocalizations.of(context)!.complaintRegister,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
          ),
          icon: SvgPicture.asset(AssetsConstants.edit),
          onPressed: () {
            context.push('/complaint_register');
          },
          backgroundColor: AppColors.greenBlue,
        ),
      ),
      drawer: const MenuDrawer(),
      onDrawerChanged: (isOpened) {
        if (isOpened) {
          if (widget.bottomNavKey.currentState != null) {
            dev.log('State is not null', name: 'Complaint');
            if (widget.bottomNavKey.currentState!.isVisible) {
              widget.bottomNavKey.currentState!.hide();
            }
          } else {
            dev.log('State is null', name: 'Complaint');
          }
        } else {
          if (widget.bottomNavKey.currentState != null) {
            dev.log('State is not null', name: 'Complaint');
            if (!widget.bottomNavKey.currentState!.isVisible) {
              widget.bottomNavKey.currentState!.show();
            }
          } else {
            dev.log('State is null', name: 'Complaint');
          }
        }
      },
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: SvgPicture.asset(
              Assets.iconsMenu,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: const Text(
          'Complaints',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (widget.bottomNavKey.currentState != null) {
                dev.log('State is not null', name: 'Complaint');
                if (widget.bottomNavKey.currentState!.isVisible) {
                  widget.bottomNavKey.currentState!.hide();
                }
              } else {
                dev.log('State is null', name: 'Complaint');
              }
              var bottomSheetController = showModalBottomSheet(
                context: context,
                builder: (context) {
                  return _buildBottomSheet(context);
                },
              );
              bottomSheetController.whenComplete(() {
                dev.log('bottom sheet is close', name: "Complaint");
                if (widget.bottomNavKey.currentState != null) {
                  dev.log('State is not null', name: 'Complaint');
                  if (!widget.bottomNavKey.currentState!.isVisible) {
                    widget.bottomNavKey.currentState!.show();
                  }
                } else {
                  dev.log('State is null', name: 'Complaint');
                }
              });
            },
            icon: SvgPicture.asset(
              Assets.iconsFilter,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      body: BlocBuilder<ComplaintBloc, ComplaintState>(
        builder: (context, state) {
          if (state is ComplaintLoading || state is ComplaintInitial) {
            const CircularProgressIndicator();
          } else if (state is ComplaintLoaded) {
            originalList = state.complaintList;

            if (state.complaintList.isEmpty) {
              return lottieAnimation(context);
            } else {
              if ((departmentValue != 'All' || statusValue != 'All') &&
                  filteredList.isEmpty) {
                return lottieAnimation(context);
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  scrollDirection: Axis.vertical,
                  controller: widget.controller,
                  itemBuilder: (context, index) {
                    return ComplaintWidget(
                      complaint: filteredList.isEmpty
                          ? originalList[index]
                          : filteredList[index],
                    );
                  },
                  itemCount: filteredList.isEmpty
                      ? originalList.length
                      : filteredList.length,
                );
              }
            }
          } else if (state is ComplaintError) {
            return Text(state.message);
          }

          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(
        minWidth: 400,
      ),
      child: ListView(
        children: [
          Text(
            "Sort",
            style: GoogleFonts.robotoCondensed(fontSize: 14),
          ),
          DropdownButtonFormField(
            padding: const EdgeInsets.only(left: 15),
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w100,
              fontSize: 14,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            hint: const Text(
              "Sort By",
            ),
            value: sortValue,
            items: const [
              DropdownMenuItem(
                value: "Newest",
                child: Text(
                  "Newest",
                ),
              ),
              DropdownMenuItem(
                value: "Oldest",
                child: Text("Oldest"),
              ),
            ],
            onChanged: (value) {
              sortValue = value!;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Department",
            style: GoogleFonts.robotoCondensed(fontSize: 14),
          ),
          DropdownButtonFormField(
            padding: const EdgeInsets.only(left: 15),
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w100,
              fontSize: 14,
              color: Colors.black,
            ),
            hint: const Text('All'),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            items: DepartmentDataConstants.departmentNameList
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: departmentValue,
            onChanged: (value) {
              departmentValue = value!;
            },
          ),
          const SizedBox(height: 15),
          Text(
            "Status",
            style: GoogleFonts.robotoCondensed(fontSize: 14),
          ),
          DropdownButtonFormField(
            value: statusValue,
            padding: const EdgeInsets.only(left: 15),
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w100,
              fontSize: 14,
              color: Colors.black,
            ),
            hint: const Text('All'),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            items: ComplaintStateDataConstants.complaintStatesForFilter
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (value) {
              statusValue = value!;
            },
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            onTap: () {
              filterList();
              context.pop();
            },
            title: "Apply Filters",
          ),
        ],
      ),
    );
  }

  void filterList() {
    filteredList = originalList;
    if (departmentValue == 'All' && statusValue == 'All') {
      filteredList = originalList;
    } else {
      if (departmentValue != 'All') {
        filteredList = filteredList
            .where((element) => element.departmentName == departmentValue)
            .toList();
      }

      if (statusValue != 'All') {
        if (statusValue == 'In Process' || statusValue == 'Approval Pending') {
          filteredList = filteredList
              .where((element) =>
                  element.status == 'In Process' ||
                  element.status == 'Approval Pending')
              .toList();
        }else {
          filteredList = filteredList
              .where((element) => element.status == statusValue)
              .toList();
        }
      }
    }

    if (sortValue == 'Newest') {
      filteredList.sort(
        (a, b) => b.registrationDate.compareTo(a.registrationDate),
      );
      dev.log(filteredList.toString(), name: 'Filtering list');
    } else if (sortValue == 'Oldest') {
      filteredList.sort(
        (a, b) => a.registrationDate.compareTo(b.registrationDate),
      );
    }
    setState(() {});
  }

  Widget lottieAnimation(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        Lottie.asset(
          Assets.lottieSearch,
          repeat: true,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Nothing to Show',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
