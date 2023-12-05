// ignore_for_file: avoid_hard_coded_text_style
import 'package:flutter/material.dart';

import '../../app.dart';

/// AppTextStyle format as follows:
/// s[fontSize][fontWeight][Color]
/// Example: s18w500Primary

class AppTextStyles {
  AppTextStyles._();
  static const _defaultLetterSpacing = 0.03;

  static const _baseTextStyle = TextStyle(
    letterSpacing: _defaultLetterSpacing,
    // height: 1.0,
  );

  //*** textStyle without color

  static TextStyle s16w500({
    required Color color,
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16.responsive(tablet: tablet, ultraTablet: ultraTablet),
        fontWeight: FontWeight.w500,
        color: color,
      ));

  static TextStyle s16w600({
    required Color color,
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16.responsive(tablet: tablet, ultraTablet: ultraTablet),
        fontWeight: FontWeight.w600,
        color: color,
      ));

  static TextStyle s16w700({
    required Color color,
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16.responsive(tablet: tablet, ultraTablet: ultraTablet),
        fontWeight: FontWeight.w700,
        color: color,
      ));

  static TextStyle s20w600({
    required Color color,
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d20.responsive(tablet: tablet, ultraTablet: ultraTablet),
        fontWeight: FontWeight.w600,
        color: color,
      ));


  //*** textStyle with color
  static TextStyle s14w500Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d14.responsive(tablet: tablet, ultraTablet: ultraTablet),
        fontWeight: FontWeight.w500,
        color: AppColors.current.primaryTextColor,
      ));

  static TextStyle s16w600Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16.responsive(tablet: tablet, ultraTablet: ultraTablet),
        fontWeight: FontWeight.w600,
        color: AppColors.current.primaryTextColor,
      ));
  static TextStyle s16w600White({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16.responsive(tablet: tablet, ultraTablet: ultraTablet),
        fontWeight: FontWeight.w600,
        color: AppColors.current.whiteColor,
      ));

  static TextStyle s16w600Secondary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16.responsive(tablet: tablet, ultraTablet: ultraTablet),
        fontWeight: FontWeight.w600,
        color: AppColors.current.secondaryTextColor,
      ));


  static TextStyle s16w600Black({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16.responsive(tablet: tablet, ultraTablet: ultraTablet),
        fontWeight: FontWeight.w600,
        color: AppColors.current.blackColor,
      ));

  static TextStyle s14w500Secondary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d14.responsive(tablet: tablet, ultraTablet: ultraTablet),
        fontWeight: FontWeight.w500,
        color: AppColors.current.secondaryTextColor,
      ));
}
