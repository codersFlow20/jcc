// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/common/widget/custom_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification Screen",
          style: Theme.of(context).textTheme.titleLarge,
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
    margin: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 5),
    padding: EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.only(
        topLeft: index == 0 ? Radius.circular(20) : Radius.circular(0),
        topRight: index == 0 ? Radius.circular(20) : Radius.circular(0),
        bottomLeft: index == 9 ? Radius.circular(20) : Radius.circular(0),
        bottomRight: index == 9 ? Radius.circular(20) : Radius.circular(0),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 5, top: 10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.notifications),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          margin: EdgeInsets.only(top: 10, right: 5),
          child: Text(
            time,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}
