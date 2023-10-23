import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class ContainerTheme{

  static BoxDecoration cardContainer = BoxDecoration(
    color: const Color(0xFFAAAAAA).withOpacity(0.1),
    border: Border.all(
      color: const Color(0xFFBDBDBD),
    ),
    borderRadius: const BorderRadius.all(Radius.circular(15)),
  );

  static InputDecoration dropdownDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );

}