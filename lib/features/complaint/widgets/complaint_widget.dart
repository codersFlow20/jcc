import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jcc/constants/string_constants.dart';

import 'package:jcc/models/complaint_model.dart';
import 'package:jcc/theme/colors.dart';
import 'package:jcc/utils/conversion.dart';

class ComplaintWidget extends StatelessWidget {
  final ComplaintModel complaint;

  const ComplaintWidget({super.key, required this.complaint});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/complaints/complaint_details');
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.paleBlue,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 5),
            Image.asset(
             getIconName(complaint.departmentName),
              height: 60,
              width: 60,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Conversion.formatDate(complaint.registrationDate),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  complaint.departmentName,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  complaint.subject,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                buildStatus(
                  context,
                  AppColors.monaLisa,
                  complaint.status,
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Complaint no. ',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: complaint.id,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildStatus(BuildContext context, Color color, String status) {
    return Row(
      children: [
        Container(
          width: 13,
          height: 13,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          status,
          style: const TextStyle(
              fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w100),
        )
      ],
    );
  }

  String getIconName(String departmentName){
        int index = DepartmentDataConstants.departmentNameList.indexOf(departmentName);
        return DepartmentDataConstants.departmentIconsAssetsName.elementAt(index);
  }
}
