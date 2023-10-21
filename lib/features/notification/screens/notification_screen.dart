// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/common/widget/custom_button.dart';
import 'package:jcc/theme/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification Screen",
          style: GoogleFonts.poppins(fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 250,
                    padding: EdgeInsets.all(20),
                    constraints: BoxConstraints(
                      minWidth: 400,
                    ),
                    child: ListView(
                      children: [
                        Text(
                          "Sort",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          hint: Text("Sort By"),
                          items: [
                            DropdownMenuItem(
                              child: Text("Date"),
                              value: "date",
                            ),
                            DropdownMenuItem(
                              child: Text("Time"),
                              value: "time",
                            ),
                            DropdownMenuItem(
                              child: Text("Name"),
                              value: "name",
                            ),
                          ],
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                        SizedBox(height: 20),
                        MyButton(onTap: () {}, title: "Apply Filters")
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.filter_alt_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildNotificationItem(
              title: "Water Department",
              subtitle:
                  "Your complaint has been resolved to your satisfaction. We're pleased to have addressed your concerns and thank you for your feedback. If you have any more issues, please don't hesitate to reach out.",
              time: "12:00 PM",
              index: index,
              context: context);
        },
      ),
    );
  }
}

Widget _buildNotificationItem(
    {required String title,
    required String subtitle,
    required String time,
    required int index,
    required BuildContext context}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    padding: const EdgeInsets.symmetric(horizontal: 15.50, vertical: 15),
    decoration: ShapeDecoration(
      color: Color(0xFFE9F7F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(3),
          bottomRight: Radius.circular(3),
        ),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xFFB0B0B0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Icon(Icons.notifications),
        ),
        SizedBox(width: 17),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Water Department',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Your complaint has been resolved to your satisfaction. We\'re pleased to have addressed your concerns and thank you for your feedback. If you have any more issues, please don\'t hesitate to reach out.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  height: 0,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Fri, 12 Oct 2023, 10:00pm',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  height: 0,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
