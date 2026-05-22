import 'package:bluetooh_share/core/theme/app_color.dart';
import 'package:bluetooh_share/core/theme/font_size.dart';
import 'package:flutter/material.dart';

abstract final class ThemeDark {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.primaryColor,
    primarySwatch: MaterialColor(
      AppColor.primaryColor.hashCode,
      AppColor.primarySwatch,
    ),
    scaffoldBackgroundColor: AppColor.neutralColor,
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: AppFontSize.sm),
      bodyMedium: TextStyle(fontSize: AppFontSize.md),
      bodyLarge: TextStyle(fontSize: AppFontSize.lg),
      titleSmall: TextStyle(fontSize: AppFontSize.xl),
      titleMedium: TextStyle(fontSize: AppFontSize.xxl),
      titleLarge: TextStyle(fontSize: AppFontSize.xxxl, height: 1.3),
      displayMedium: TextStyle(fontSize: AppFontSize.display),
    ),
  );
}
