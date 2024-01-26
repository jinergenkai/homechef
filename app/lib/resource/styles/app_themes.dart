import 'package:flutter/material.dart';

import '../../app.dart';

/// define custom themes here
final lightTheme = ThemeData(
  fontFamily: "Montserrat",
  brightness: Brightness.light,
  splashColor: Colors.transparent,
)..addAppColor(
    AppThemeType.light,
    AppColors.defaultAppColor,
  );

final darkTheme = ThemeData(
  fontFamily: "Montserrat",
  brightness: Brightness.light,
  // brightness: Brightness.dark,
  splashColor: Colors.transparent,
)..addAppColor(
    AppThemeType.dark,
    // AppColors.darkThemeColor,
    AppColors.chefAppColor,
  );

enum AppThemeType { light, dark }

extension ThemeDataExtensions on ThemeData {
  static final Map<AppThemeType, AppColors> _appColorMap = {};

  void addAppColor(AppThemeType type, AppColors appColor) {
    _appColorMap[type] = appColor;
  }

  AppColors get appColor {
    return _appColorMap[AppThemeSetting.currentAppThemeType] ?? AppColors.defaultAppColor;
  }

  // get dark theme
  bool get isDarkTheme => brightness == Brightness.dark;
}

class AppThemeSetting {
  const AppThemeSetting._();
  static late AppThemeType currentAppThemeType = AppThemeType.light;
}
