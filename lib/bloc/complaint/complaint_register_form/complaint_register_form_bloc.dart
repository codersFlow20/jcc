import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:jcc/constants/string_constants.dart';

class ComplaintRegisterFormBloc extends FormBloc<Map<String, dynamic>, String> {
  ComplaintRegisterFormBloc() {
    addFieldBlocs(fieldBlocs: [
      department,
      subject,
      description,
      wardNo,
      area,
      detailedAddress,
    ]);

    department.onValueChanges(
      onData: (previous, current) async* {
        if (current.value == null || current.value!.isEmpty) {
          subject.updateItems(const []);
        } else {
          subject.updateItems(
            DepartmentDataConstants.departmentComplaintsData[current.value!]!,
          );
        }
      },
    );

    wardNo.onValueChanges(
      onData: (previous, current) async* {
        if (current.value == null || current.value!.isEmpty) {
          area.updateItems(const []);
        } else {
          area.updateItems(
            DepartmentDataConstants.wardNoAreas[current.value!]!,
          );
        }
      },
    );
  }

  final department = SelectFieldBloc(
    items: DepartmentDataConstants.departmentNameList,
    validators: [
      (value) {
        if (value == null) {
          return 'You must select department for the complaint';
        }
        return null;
      }
    ],
  );

  final subject = SelectFieldBloc(
    validators: [
          (value) {
        if (value == null) {
          return 'You must select subject of the complaint';
        }
        return null;
      }
    ],
  );
  final description = TextFieldBloc();

  final wardNo = SelectFieldBloc(
    items: DepartmentDataConstants.wardNoAreas.keys.toList(),
    validators: [
      (value) {
        if (value == null) {
          return 'You must select ward number for the complaint';
        }
        return null;
      }
    ],
  );

  final area = SelectFieldBloc(
    validators: [
          (value) {
        if (value == null) {
          return 'You must area for the complaint';
        }
        return null;
      }
    ],
  );
  final detailedAddress = TextFieldBloc();

  @override
  FutureOr<void> onSubmitting() {
    try {
      final data = {
        'department' : department.value,
        'subject' : subject.value,
        'description' : description.value,
        'wardNo' : wardNo.value,
        'area' : area.value,
        'detailedAddress' : detailedAddress.value,
      };

      emitSuccess(successResponse: data);
    }catch(e) {
      dev.log('Got error in complaint register: $e', name: 'Complaint');
      emitFailure(failureResponse: 'Error: $e');
    }
  }
}
