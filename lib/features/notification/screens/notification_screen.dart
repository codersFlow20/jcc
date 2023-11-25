// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/common/widget/menu_drawer.dart';
import 'package:jcc/constants/string_constants.dart';
import 'package:jcc/generated/assets.dart';
import 'package:jcc/theme/colors.dart';
import 'package:lottie/lottie.dart';
import '../../../bloc/notification/notification_bloc.dart';
import '../../../models/notification_model.dart';
import '../../../utils/conversion.dart';
import '../../../utils/ui_utils.dart';
import 'package:jcc/common/widget/primary_button.dart';

import '../../../common/widget/scroll_to_hide_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
    required this.controller,
    required this.bottomNavKey,
  });

  final ScrollController controller;
  final GlobalKey<ScrollToHideWidgetState> bottomNavKey;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<NotificationModel> listOfNotification = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const MenuDrawer(),
      onDrawerChanged: (isOpened) {
        if (isOpened) {
          if (widget.bottomNavKey.currentState != null) {
            dev.log('State is not null', name: 'Notification');
            if (widget.bottomNavKey.currentState!.isVisible) {
              widget.bottomNavKey.currentState!.hide();
            }
          } else {
            dev.log('State is null', name: 'Notification');
          }
        } else {
          if (widget.bottomNavKey.currentState != null) {
            dev.log('State is not null', name: 'Notification');
            if (!widget.bottomNavKey.currentState!.isVisible) {
              widget.bottomNavKey.currentState!.show();
            }
          } else {
            dev.log('State is null', name: 'Notification');
          }
        }
      },
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset(
                Assets.iconsMenu,
                fit: BoxFit.cover,
              )),
        ),
        title: Text(
          CommonDataConstants.notifications,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 22,
              ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (widget.bottomNavKey.currentState != null) {
                dev.log('State is not null', name: 'Notification');
                if (widget.bottomNavKey.currentState!.isVisible) {
                  widget.bottomNavKey.currentState!.hide();
                }
              } else {
                dev.log('State is null', name: 'Notification');
              }
              var bottomSheetController = showModalBottomSheet(
                context: context,
                builder: (context) {
                  return _buildBottomSheet(context);
                },
              );
              bottomSheetController.whenComplete(() {
                if (widget.bottomNavKey.currentState != null) {
                  dev.log('State is not null', name: 'Notification');
                  if (!widget.bottomNavKey.currentState!.isVisible) {
                    widget.bottomNavKey.currentState!.show();
                  }
                } else {
                  dev.log('State is null', name: 'Notification');
                }
              });
            },
            icon: SvgPicture.asset(Assets.iconsFilter),
          ),
        ],
      ),
      body: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is NotificationLoading || state is NotificationInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NotificationLoaded) {
            if (state.notificationList.isEmpty) {
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
            } else {
              listOfNotification = state.notificationList;
              return ListView.separated(
                controller: widget.controller,
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
            }
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

  String sortValue = 'Newest';

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      height: 200,
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
          DropdownButtonFormField(
            value: sortValue,
            padding: const EdgeInsets.only(left: 15),
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w100,
              fontSize: 14,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
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
              sortValue = value!;
            },
          ),
          SizedBox(height: 20),
          PrimaryButton(
            onTap: () {
              if (sortValue == 'Newest') {
                listOfNotification.sort(
                  (a, b) => b.timeStamp.compareTo(a.timeStamp),
                );
              } else if (sortValue == 'Oldest') {
                listOfNotification.sort(
                  (a, b) => a.timeStamp.compareTo(b.timeStamp),
                );
              }
              setState(() {});
              context.pop();
            },
            title: "Apply Filters",
          ),
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
          UIUtils.getIconName(
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
                    Conversion.formatDateTime(notification.timeStamp),
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
