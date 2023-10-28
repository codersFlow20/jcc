import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/constants/string_constants.dart';
import 'package:jcc/features/complaint/widgets/complaint_widget.dart';
import 'package:jcc/repositories/notification_repository.dart';
import 'package:jcc/theme/colors.dart';
import '../../../bloc/complaint/complaint_bloc.dart';
import 'dart:developer' as dev;
import 'package:onesignal_flutter/onesignal_flutter.dart';

class ComplaintList extends StatelessWidget {
  const ComplaintList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Register Complaint",
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: Icon(Icons.edit, color: AppColors.white),
        onPressed: () {
          OneSignal.Notifications.requestPermission(true);
          dev.log("${OneSignal.Notifications.permission}",
              name: "Notification Users : ");
          dev.log("${OneSignal.User.pushSubscription.token}",
              name: "Notification Token : ");
          dev.log("${OneSignal.User.pushSubscription.id}",
              name: "Notification ID : ");

          NotificationRepository().sendPushNotification(
            "Nothing to say ",
            "HI THERE",
            DepartmentDataConstants.listOfToken,
          );
          // context.push('/complaintRegister');
        },
        backgroundColor: AppColors.brilliantAzure,
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
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
            onPressed: () {},
            icon: const Icon(Icons.sort),
          )
        ],
      ),
      body: BlocBuilder<ComplaintBloc, ComplaintState>(
        builder: (context, state) {
          if (state is ComplaintLoading || state is ComplaintInitial) {
            const CircularProgressIndicator();
          } else if (state is ComplaintLoaded) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ComplaintWidget(complaint: state.complaintList[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: state.complaintList.length,
              ),
            );
          } else if (state is ComplaintError) {
            return Text(state.message);
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
