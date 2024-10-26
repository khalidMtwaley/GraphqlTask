import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_manager.dart';
import 'styles.dart';

class AppTheme {
  //Light theme

  static final darkThemeMode = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsManager.red),
      ),
    ),
    scaffoldBackgroundColor: ColorsManager.black,
    fontFamily: "Rubik",
  );
}
