// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/bloc/complaint/complaint_register_form/complaint_register_form_bloc.dart';
import 'package:jcc/common/widget/custom_button.dart';
import 'package:jcc/constants/complaint_data.dart';
import 'package:jcc/constants/string_constants.dart';
import 'dart:developer' as dev;

import 'package:jcc/theme/container_theme.dart';

class ComplaintRegistrationScreen extends StatefulWidget {
  const ComplaintRegistrationScreen({super.key});

  @override
  State<ComplaintRegistrationScreen> createState() =>
      _ComplaintRegistrationScreenState();
}

class _ComplaintRegistrationScreenState
    extends State<ComplaintRegistrationScreen> {
  File? _image1;
  File? _image2;
  File? _image3;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  late String _department = "";
  late String _subject = "";
  late String _description = "";
  late String _ward = "";
  late String _area = "";
  late String _address = "";
  late List<String> _imageUrls = [];
  late final List<String> _departmentList =
      ComplaintJsonData.departmentListData;
  late List<String> _subjectList = [
    "-- select Subject -- ",
  ];
  late int selectedDepartment;

  late final List<String> _wardList = [
    " -- select Ward No -- ",
    "ward 1",
    "ward 2",
    "ward 3",
    "ward 4",
    "ward 5",
    "ward 6",
    "ward 7"
  ];

  late final List<String> _areaList = [
    " -- select Area -- ",
    "area 1",
    "area 2",
    "area 3",
    "area 4",
    "area 5",
    "area 6",
    "area 7"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Complaint"),
      ),
      body: BlocProvider(
        create: (context) => ComplaintRegisterFormBloc(),
        child: Builder(
          builder: (context) {
            final registerBloc = context.read<ComplaintRegisterFormBloc>();

            return FormBlocListener<ComplaintRegisterFormBloc,
                Map<String, dynamic>, String>(
              onSubmitting: (context, state) {},
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What is your problem ?",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      _buildDropdownField(
                        hint: 'Select department',
                        bloc: registerBloc.department,
                      ),
                      _buildDropdownField(
                        hint: 'Select subject',
                        bloc: registerBloc.subject,
                      ),
                      // _buildTextInput(
                      //   title: "Department",
                      //   hint: " -- Select Department -- ",
                      //   listData: DepartmentDataConstants.departmentComplaintsData.keys
                      //       .toList(),
                      //   // listData: ['Health'],
                      //   onChange: (val) {
                      //     setState(() {
                      //       _department = val;
                      //       _subject = '';
                      //       // print(ComplaintJsonData.departmentSubjectData
                      //       //     .where((element) => element["name"] == val)
                      //       //     .toList()[0]["subject"] as List<String>);
                      //     });
                      //   },
                      // ),
                      // _buildTextInput(
                      //   title: "Subject",
                      //   hint: " -- Select Subject -- ",
                      //   listData: (_department == '')
                      //       ? []
                      //       : DepartmentDataConstants
                      //       .departmentComplaintsData[_department]!
                      //       .toList(),
                      //   onChange: (val) {
                      //     setState(() {
                      //       _subject = val;
                      //     });
                      //   },
                      // ),
                      // _buildAreaInput(
                      //   title: "Description",
                      //   hint: "About problem",
                      //   controller: _descriptionController,
                      //   onChange: (val) {
                      //     setState(() {
                      //       _description = val;
                      //     });
                      //   },
                      // ),
                      // Text(
                      //   "\nWhere problem occurred ? ",
                      //   style: GoogleFonts.poppins(
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.w300,
                      //   ),
                      // ),
                      // _buildTextInput(
                      //   title: "Ward no",
                      //   hint: "-- select ward no --",
                      //   listData: _wardList,
                      //   onChange: (val) {
                      //     setState(() {
                      //       _ward = val;
                      //     });
                      //   },
                      // ),
                      // _buildTextInput(
                      //   title: "Area",
                      //   hint: "-- Select area --",
                      //   listData: _areaList,
                      //   onChange: (val) {
                      //     setState(() {
                      //       _area = val;
                      //     });
                      //   },
                      // ),
                      // _buildAreaInput(
                      //   title: "Address",
                      //   hint: "Address of problem",
                      //   controller: _addressController,
                      //   onChange: (val) {
                      //     setState(() {
                      //       _address = val;
                      //     });
                      //   },
                      // ),
                      // SizedBox(height: 10),
                      // Text(
                      //   "Click Photographs of problem",
                      //   style: GoogleFonts.poppins(
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      // SizedBox(height: 10),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: Container(
                      //         height: 200,
                      //         decoration: BoxDecoration(
                      //           border: Border.all(
                      //             color: Colors.grey,
                      //           ),
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         child: Center(
                      //           child: Icon(
                      //             Icons.camera_alt_outlined,
                      //             color: Colors.grey,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(width: 10),
                      //     Expanded(
                      //       child: Container(
                      //         height: 200,
                      //         decoration: BoxDecoration(
                      //           border: Border.all(
                      //             color: Colors.grey,
                      //           ),
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         child: Center(
                      //           child: Icon(
                      //             Icons.camera_alt_outlined,
                      //             color: Colors.grey,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(width: 10),
                      //     Expanded(
                      //       child: Container(
                      //         height: 200,
                      //         decoration: BoxDecoration(
                      //           border: Border.all(
                      //             color: Colors.grey,
                      //           ),
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         child: Center(
                      //           child: Icon(
                      //             Icons.camera_alt_outlined,
                      //             color: Colors.grey,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 10),
                      MyButton(
                        onTap: () {
                          dev.log("Register Complaint",
                              name: "Register Complaint");
                          dev.log(_department, name: "Department");
                          dev.log(_subject, name: "Subject");
                          dev.log(_descriptionController.text,
                              name: "Description");
                          dev.log(_ward, name: "Ward");
                          dev.log(_area, name: "Area");
                          dev.log(_addressController.text, name: "Address");
                        },
                        title: "Register Complaint",
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required SelectFieldBloc bloc,
    required String hint,
  }) {
    return DropdownFieldBlocBuilder(
      selectFieldBloc: bloc,
      textOverflow: TextOverflow.ellipsis,
      textStyle: const TextStyle(fontSize: 14),
      hint: Text(hint),
      // decoration: InputDecoration(
      //   labelText: label,
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      //   contentPadding: const EdgeInsets.symmetric(
      //     vertical: 10,
      //     horizontal: 15,
      //   ),
      // ),
      decoration: ContainerTheme.dropdownDecoration,
      itemBuilder: (context, value) {
        return FieldItem(child: Text(value.toString()));
      },
    );
  }

  Widget _buildAreaInput({
    required String title,
    required String hint,
    required TextEditingController controller,
    required Function onChange,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          minLines: 3,
          maxLines: 5,
          controller: controller,
          decoration: ContainerTheme.dropdownDecoration,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          onChanged: (val) {
            onChange(val);
          },
        ),
      ],
    );
  }

  Widget _buildTextInput({
    required String title,
    required String hint,
    required List<String> listData,
    required Function onChange,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        DropdownButtonFormField(
          isExpanded: true,
          hint: Text(hint),
          decoration: ContainerTheme.dropdownDecoration,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          items: listData.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: (val) {
            onChange(val);
          },
        )
      ],
    );
  }
}
