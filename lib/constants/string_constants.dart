import 'dart:core';

import 'package:jcc/generated/assets.dart';

class CommonDataConstants {
  static final List<String> bottomNavigation = [
    "Home",
    "Complaints",
    "Notifications",
  ];

  static const String home = "Home";
}

class ScreensDataConstants{
  static const String recentTitle = "Recent Complaints";
}
class ComplaintStateDataConstants {
  static final List<String> complaintState = [
    "Registered",
    "On Hold",
    "In Process",
    "Solved"
  ];

  static final List<String> complaintStateStatement = [
    "Complaints Registered",
    "Complaints  Hold",
    "Complaints In Process",
    "Complaints Solved",
  ];
}
class DepartmentDataConstants {
  static final List<String> departmentNameList = [
    "Water Works",
    "Slum",
    "Light eSMART CITY AREA",
    "Civil",
    "Health",
    "Solid Waste Branch",
    "Estate",
    "Town Planning",
    "UGD",
    "House Tax",
    "UCD",
    "ICDS",
    "Garden",
    "Project Planning",
    "Light EESL NAGAR SIm AREA",
    "Security",
    "FLOOD CONTROL",
  ];

  static final List<String> departmentIconsAssetsName = [
    Assets.departmentIconsWaterDepartment,
    Assets.departmentIconsSlumDepartment,
    Assets.departmentIconsLightEESL,
    Assets.departmentIconsCivil,
    Assets.departmentIconsHealth,
    Assets.departmentIconsSolidWaste,
    Assets.departmentIconsEstate,
    Assets.departmentIconsTownPlanning,
    Assets.departmentIconsUndergroundSewers,
    Assets.departmentIconsHouseTax,
    Assets.departmentIconsUCD,
    Assets.departmentIconsICDS,
    Assets.departmentIconsGarden,
    Assets.departmentIconsProjectPlanning,
    Assets.departmentIconsESmartLight,
    Assets.departmentIconsSecurity,
    Assets.departmentIconsFloodControl,
  ];
}
