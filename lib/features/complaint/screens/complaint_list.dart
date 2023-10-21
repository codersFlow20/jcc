// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/theme/colors.dart';

class ComplaintList extends StatefulWidget {
  const ComplaintList({super.key});

  @override
  State<ComplaintList> createState() => _ComplaintListState();
}

class _ComplaintListState extends State<ComplaintList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Complaints",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // context.go('/login');
            },
            icon: Icon(Icons.filter_alt_outlined),
          )
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.antiFlashWhite
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  width: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date and times",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    Text(
                      "Title",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "description",
                      style: GoogleFonts.poppins(
                          fontSize: 12),
                    ),
                    Text("🔴 On Hold"),
                    Text("Complaint Id : 64564ABH"),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
