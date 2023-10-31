import 'dart:core';

import 'package:jcc/generated/assets.dart';

class CommonDataConstants {
  static final List<String> bottomNavigation = [
    "Home",
    "Complaints",
    "Notifications",
  ];

  static final List<String> complaintStatuses = [
    'Registered',
    'In Process',
    'On Hold',
    'Solved',
  ];

  static const String home = "Home";
  static const String userProfile = "Profile";

  static const String language = "Language";
  static const String aboutUs = "About us";
  static const String needAnyHelp = "Need any help?";
  static const String logOut = "Log out";
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

  static const Map<String, List<String>> departmentComplaintsData = {
    'Water Works': [
      'No Water',
      'Irregular Water',
    ],
    'Slum': ['Others'],
    'Health': [
      'Fogging Work',
      'Food Checking',
    ],
  };

  static const Map<String, List<String>> wardNoAreas = {
    '1' : [
      'Area 1',
      'Area 2',
    ],
    '2' : [
      'Punitnagar',
      'Rameshwarnagar',
    ],
  };

  static final List<String> departmentIconsAssetsName = [
    Assets.departmentIconsWaterDepartment,
    Assets.departmentIconsSlumDepartment,
    Assets.departmentIconsLightEesl,
    Assets.departmentIconsCivil,
    Assets.departmentIconsHealth,
    Assets.departmentIconsSolidWaste,
    Assets.departmentIconsEstate,
    Assets.departmentIconsTownPlanning,
    Assets.departmentIconsUndergroundSewers,
    Assets.departmentIconsHouseTax,
    Assets.departmentIconsUcd,
    Assets.departmentIconsIcds,
    Assets.departmentIconsGarden,
    Assets.departmentIconsProjectPlanning,
    Assets.departmentIconsESmartLight,
    Assets.departmentIconsSecurity,
    Assets.departmentIconsFloodControl,
  ];
}
