// ignore_for_file: avoid_hard_coded_colors
import 'package:flutter/material.dart';

import '../../app.dart';

class AppColors {
  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.primaryGradient,
    required this.disabledColor,
    required this.blackColor,
    required this.whiteColor,
    required this.redColor,
  });

  static late AppColors current;

  final Color primaryColor;
  final Color secondaryColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color disabledColor;
  final Color blackColor;
  final Color whiteColor;
  final Color redColor;

  /// gradient
  final LinearGradient primaryGradient;

  static const defaultAppColor = AppColors(
    primaryColor: Color.fromARGB(255, 156, 221, 222),
    secondaryColor: Color.fromARGB(255, 62, 62, 70),
    primaryTextColor: Color.fromARGB(255, 67, 78, 88),
    secondaryTextColor: Color.fromARGB(255, 156, 221, 222),
    primaryGradient: LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
    disabledColor: Color.fromARGB(255, 216, 216, 216),
    blackColor: Color.fromARGB(255, 0, 0, 0),
    whiteColor: Color.fromARGB(255, 255, 255, 255),
    redColor: Color.fromARGB(255, 255, 0, 0),
  );

  static const darkThemeColor = AppColors(
    primaryColor: Color.fromARGB(255, 62, 62, 70),
    secondaryColor: Color.fromARGB(255, 156, 221, 222),
    primaryTextColor: Color.fromARGB(255, 156, 221, 222),
    secondaryTextColor: Color.fromARGB(255, 62, 62, 70),
    primaryGradient: LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
    disabledColor: Color.fromARGB(255, 216, 216, 216),
    blackColor: Color.fromARGB(255, 0, 0, 0),
    whiteColor: Color.fromARGB(255, 255, 255, 255),
    redColor: Color.fromARGB(255, 255, 0, 0),
  );

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;

    current = appColor;

    return current;
  }

  AppColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    LinearGradient? primaryGradient,
    Color? disabledColor,
    Color? blackColor,
    Color? whiteColor,
    Color? redColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      disabledColor: disabledColor ?? this.disabledColor,
      blackColor: blackColor ?? this.blackColor,
      whiteColor: whiteColor ?? this.whiteColor,
      redColor: redColor ?? this.redColor,
    );
  }
}
