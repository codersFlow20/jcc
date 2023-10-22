// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:jcc/common/widget/custom_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Screen"),
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
          );
        },
      ),
    );
  }
}

Widget _buildNotificationItem(
    {required String title, required String subtitle, required String time}) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.notifications),
      ),
      isThreeLine: true,
      dense: true,
      title: Text(
        "Water Department",
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
          "Your complaint has been resolved to your satisfaction. We're pleased to have addressed your concerns and thank you for your feedback. If you have any more issues, please don't hesitate to reach out."),
      trailing: Text("12:00 PM"),
    ),
  );
}
