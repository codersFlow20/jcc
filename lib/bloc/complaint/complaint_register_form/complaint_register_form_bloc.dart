import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:jcc/constants/string_constants.dart';

class ComplaintRegisterFormBloc extends FormBloc<Map<String, dynamic>, String> {
  ComplaintRegisterFormBloc() {
    addFieldBlocs(fieldBlocs: [
      department,
      subject,
    ]);

    department.onValueChanges(
      onData: (previous, current) async* {
        if (current.value == null || current.value!.isEmpty) {
          subject.updateItems([]);
        }else {
          updateDepartmentComplaints(current.value!);
        }
      },
    );
  }

  final department = SelectFieldBloc(
    items: DepartmentDataConstants.departmentComplaintsData.keys.toList(),
  );

  final subject = SelectFieldBloc();

  void updateDepartmentComplaints(String department) {
    final departments = DepartmentDataConstants.departmentComplaintsData;

    switch(department) {
      case 'Water Works': {
        subject.updateItems(departments['Water Works']!);
      }
      case 'Slum': {
        subject.updateItems(departments['Slum']!);
      }
      case 'Health': {
        subject.updateItems(departments['Health']!);
      }
    }

  }

  @override
  FutureOr<void> onSubmitting() {
    // TODO: implement onSubmitting
    throw UnimplementedError();
  }
}
