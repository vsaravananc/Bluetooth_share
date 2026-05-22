import 'dart:ui';

abstract final class AppColor {
  static const primaryColor = Color(0xFF5D5CFF);
  static const secondaryColor = Color(0xFF00F0FF);
  static const tertiaryColor = Color(0xFFBF5200);
  static const neutralColor = Color(0xFF0A0A0A);
  static const borderColor = Color.fromARGB(255, 185, 185, 185);
  static const primarySwatch = {
    50: Color(0xFFF2EFFF),
    100: Color(0xFFC4C4FF),
    200: Color(0xFF9FA0FF),
    300: Color(0xFF7A7BFF),
    400: Color(0xFF8283FF),
    500: primaryColor,
    600: Color(0xFF4643E9),
    700: Color(0xFF2B20D2),
    800: Color(0xFF1500A8),
    900: Color(0xFF09006B),
  };
}
