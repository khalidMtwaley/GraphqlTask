// import 'package:flutter/material.dart';
// import 'package:quon_app/core/theme/app_pallete.dart';
// import 'package:quon_app/core/utils/extensions/widget_extensions.dart';

// class CustomContainerBorder extends StatelessWidget {
//   const CustomContainerBorder({
//     super.key,
//     required this.child,
//     this.padding,
//     this.bottomverticalpadding,
//     this.Externalhorizontalpadding,
//   });
//   final Widget child;
//   final EdgeInsetsGeometry? padding;
//   final double? bottomverticalpadding;
//   final double? Externalhorizontalpadding;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//             padding: padding ?? null,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4),
//                 border: Border.all(color: AppPallete.borderColor)),
//             child: child)
//         .paddingVertical(bottomverticalpadding ?? 16)
//         .paddingHorizontal(Externalhorizontalpadding ?? 0);
//   }
// }
