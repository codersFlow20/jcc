import 'package:flutter/material.dart';
import 'package:jcc/features/complaint/widgets/complaint_widget.dart';
import 'package:jcc/models/complaint_model.dart';

import '../../../theme/colors.dart';

class ComplaintList extends StatelessWidget {
  const ComplaintList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ComplaintWidget(
          complaint: ComplaintModel(
            id: '45',
            description: 'description',
            registrationDate: DateTime.now(),
            departmentName: 'Water Works',
            subject: 'Irregular Water ',
            status: 'Registered',
            ward: '',
            area: '',
            userId: '',
            imageUrls: const [],
            optionalNumber: '',
            siteAddress: '',
            uniquePin: '',
            assignedId: '',
            isAssigned: false,
            isLocked: false,
          ),
        ),
      ),
    );
  }
}
