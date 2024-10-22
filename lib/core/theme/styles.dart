import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theme/colors_manager.dart';

abstract class Styles {
  static TextStyle mainTextStyle() => const TextStyle(
        fontFamily: 'Rubik',
      );
//////////////////

  static TextStyle Rubic300({
    required double fontSize,
    required Color color,
  }) {
    return mainTextStyle().copyWith(
      fontFamily: 'Rubik-Light',
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w300,
      color: color,
    );
  }

  //////////////////
  static TextStyle Rubic400({
    required double fontSize,
    required Color color,
  }) {
    return mainTextStyle().copyWith(
      fontFamily: 'Rubik-Regular',
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  /////////////////
  static TextStyle Rubic500({
    required double fontSize,
    required Color color,
  }) {
    return mainTextStyle().copyWith(
      fontFamily: 'Rubik-Medium',
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
  ////////////////

  static TextStyle Rubic600({
    required double fontSize,
    required Color color,
  }) {
    return mainTextStyle().copyWith(
      fontFamily: 'Rubik-SemiBold',
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  //////////
  static TextStyle ButtomStyle({
    Color? color,
  }) {
    return mainTextStyle().copyWith(
      fontFamily: 'Rubik-Medium',
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.white,
    );
  }
}
