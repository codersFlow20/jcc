import '../constants/string_constants.dart';

class UiUtils {
  static  String getIconName(String departmentName){
    int index = DepartmentDataConstants.departmentNameList.indexOf(departmentName);
    return DepartmentDataConstants.departmentIconsAssetsName.elementAt(index);
  }
}