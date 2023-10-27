import 'dart:core';

import 'package:jcc/generated/assets.dart';

class UserDataConstants {
  static final List<String> bottomNavigation = [
    "Home",
    "Complaints",
    "Notifications",
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

  static final Map<String, List<String>> departmentComplaintsData = {
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
