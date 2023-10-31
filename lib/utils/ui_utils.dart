import 'package:flutter/material.dart';

import '../constants/string_constants.dart';

class UIUtils {
  static String getIconName(String departmentName) {
    int index =
        DepartmentDataConstants.departmentNameList.indexOf(departmentName);
    return DepartmentDataConstants.departmentIconsAssetsName.elementAt(index);
  }

  static void showSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
