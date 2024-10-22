import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:task/core/theme/colors_manager.dart';

class CustomElevatedButtonIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Widget label;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;

  const CustomElevatedButtonIcon({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.r)),
      width: double.infinity,
      height: 46.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            label,
            SizedBox(width: 8.w),
            Icon(
              icon,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
