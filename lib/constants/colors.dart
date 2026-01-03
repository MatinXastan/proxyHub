import 'package:flutter/material.dart';

class AppColors {
  // جلوگیری از ایجاد نمونه از کلاس
  AppColors._();

  // پالت رنگی اصلی (Main Palette)
  static const Color navyBlue = Color(0xFF29467E);
  static const Color royalBlue = Color(0xFF1152D4);
  static const Color slateBlue = Color(0xFF6A5ACD);

  // رنگ‌های پس‌زمینه برای حالت دارک (Dark Mode Backgrounds)
  static const Color darkBackgroundDeep = Color(0xFF0A1128);
  static const Color darkBackgroundLight = Color(0xFF1E2A47);

  // رنگ‌های تاکیدی و متن (Accents & Text)
  static const Color lightBlueAccent = Color(0xFFADD8E6);
  static const Color paleBlueAccent = Color(0xFFB0E0E6);

  // رنگ‌های کاربردی (Semantic Colors)
  static const Color successGreen = Color(0xFF22C55E); // برای پینگ عالی
  static const Color warningOrange = Color(0xFFBF9510); // برای پینگ متوسط
  static const Color errorRed = Color(0xFFF44336); // برای پروکسی غیرفعال
  static const Color white = Colors.white; // برای پروکسی غیرفعال

  static const Color searchFieldBackground = Color(0xFF1b2538);
  static const Color searchIconColor = Color(0xFF63738a);
  static const Color iconSettingColor = Color(0xFF94A3B8);
  static const Color cardBackgroundColor = Color(0xFF172339);
  static const Color cardCircleBackgroundColor = Color(0xFF243148);
  static const Color tagBackgroundColor = Color(0xFF1E293B);
  static const Color dividerColor = Color(0xFF172134);
  static const Color selectedIconNavigationColor = Color(0xFF1152D4);
}
