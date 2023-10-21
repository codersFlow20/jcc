//Editor Bhavy Ukani

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/common/widget/custom_button.dart';

void main() => runApp(ComplainRegistration());

class ComplainRegistration extends StatefulWidget {
  const ComplainRegistration({super.key});

  @override
  State<ComplainRegistration> createState() => _ComplainRegistrationState();
}

class _ComplainRegistrationState extends State<ComplainRegistration> {
  List departmentList = [
    '-- Select Department -- ',
    'World',
    'Flutter',
    'Dart'
  ];
  List subjectList = ['-- Select subject -- ', 'World', 'Flutter', 'Dart'];
  List wardNo = ['-- Select Ward No -- ', 'World', 'Flutter', 'Dart'];
  List area = ['-- Select Area -- ', 'World', 'Flutter', 'Dart'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Complaint Registration",
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "What is your problem?",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildDropdownButtonMenu(
                      context, "Department", departmentList),
                  SizedBox(height: 10),
                  _buildDropdownButtonMenu(context, "Subject", subjectList),
                  SizedBox(height: 10),
                  _buildInputArea(context, "Description", "About your problem"),
                  SizedBox(height: 20),
                  Text(
                    "Where proble occured?",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildDropdownButtonMenu(context, "Ward no", wardNo),
                  SizedBox(height: 10),
                  _buildDropdownButtonMenu(context, "Area", area),
                  SizedBox(height: 10),
                  _buildInputArea(
                      context, "Detailed Address", "enter location of problem"),
                  SizedBox(height: 20),
                  Text(
                    "Upload Image",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.add),
                      ),
                      Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.add),
                      ),
                      Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: MyButton(
                      onTap: () {},
                      title: "Submit",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownButtonMenu(
      BuildContext context, String title, List _list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "  $title",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        SizedBox(height: 10),
        DropdownButtonFormField(
          isDense: true,
          style: GoogleFonts.poppins(color: Colors.grey),
          value: _list[0],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          items: _list
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildInputArea(BuildContext context, String title, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "  $title",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        SizedBox(height: 10),
        TextField(
          minLines: 2,
          maxLines: 5,
          decoration: InputDecoration(
            isDense: true,
            label: Text(hint),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: "About your problem",
          ),
        ),
      ],
    );
  }
}
