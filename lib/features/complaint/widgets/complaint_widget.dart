import 'package:flutter/material.dart';

import 'package:jcc/models/complaint_model.dart';
import 'package:jcc/theme/colors.dart';
import 'package:jcc/utils/conversion.dart';

class ComplaintWidget extends StatelessWidget {
  final ComplaintModel complaint;

  const ComplaintWidget({super.key, required this.complaint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.only(left: 5, top: 10),
        height: 120,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2,
                offset:Offset(  0, 2)
              ),
              BoxShadow(
                  color: Colors.white,
                  blurRadius: 2,
                  offset:Offset(  0, 2)
              )
            ],
            color: AppColors.mintTulip,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/departmentIcons/Water_Department.png',
              height: 70,
              width: 70,
            ),
            const SizedBox(
              width: 5,
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
                  Colors.black,
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
}
