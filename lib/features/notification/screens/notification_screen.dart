// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/common/widget/custom_button.dart';
import 'package:jcc/theme/colors.dart';
import '../../../bloc/notification/notification_bloc.dart';
import '../../../models/notification_model.dart';
import '../../../utils/conversion.dart';
import '../../../utils/ui_utils.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
     List<NotificationModel> list = [];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return _buildBottomSheet(context,list);
                },
              );
            },
            icon: Icon(Icons.filter_alt_outlined),
          ),
        ],
      ),
      body: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state is NotificationLoading || state is NotificationInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NotificationLoaded) {
            list = state.notificationList;
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: state.notificationList.length,
              itemBuilder: (context, index) {
                return _buildNotificationItem(
                  notification: state.notificationList[index],
                  context: context,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
            );
          } else if (state is NotificationError) {
            return Center(
              child: Text(state.message),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context, List<NotificationModel> list) {
    String values = "" ;
    return Container(
      height: 350,
      padding: EdgeInsets.all(20),
      constraints: BoxConstraints(
        minWidth: 400,
      ),
      child: ListView(
        children: [
          Text(
            "Sort",
            style: GoogleFonts.robotoCondensed(fontSize: 14),
          ),
          SizedBox(height: 15),
          DropdownButtonFormField(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w100,
              fontSize: 14,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
            hint: Text(
              "Sort By",
            ),
            items: [
              DropdownMenuItem(
                child: Text(
                  "Newest",
                ),
                value: "Newest",
              ),
              DropdownMenuItem(
                child: Text("Oldest"),
                value: "Oldest",
              ),
            ],
            onChanged: (value) {
              values = value!;
            },
          ),
          SizedBox(height: 20),
          MyButton(onTap: () {
            if (values == "Newest") {
              context.read<NotificationBloc>().add(UpdateNotification(list.toList()));
            } else if(values == 'Oldest'){
              context.read<NotificationBloc>().add(UpdateNotification(list.reversed.toList()));
            }
          list =   list.reversed.toList();
            Navigator.pop(context);

            // context.read<NotificationBloc>().add(ToggleOrderOfNotification());
          }, title: "Apply Filters"),
          SizedBox(
            height: 72,
          )
        ],
      ),
    );
  }
}

Widget _buildNotificationItem(
    {required NotificationModel notification, required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.antiBlueFlash,
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    padding: const EdgeInsets.only(left: 5, right: 15.5, top: 15, bottom: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          UiUtils.getIconName(
            notification.departmentName,
          ),
          width: 50,
          height: 50,
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 101,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.departmentName,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                // overflow: TextOverflow.ellipsis,
                notification.description,
                style: TextStyle(fontSize: 10, fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    Conversion.formatDate(notification.timeStamp),
                    style: TextStyle(
                      fontSize: 8,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
