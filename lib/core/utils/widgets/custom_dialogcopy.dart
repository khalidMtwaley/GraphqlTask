// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:quon_app/core/theme/app_pallete.dart';
// import 'package:quon_app/core/theme/styles.dart';
// import 'package:quon_app/core/utils/widgets/custom_button.dart';

// class CustomImageDialog extends StatelessWidget {
//   const CustomImageDialog(
//       {super.key,
//       required this.iconPath,
//       required this.title,
//       this.subTitle,
//       this.filldButtonTxt,
//       this.flatButtonTxt});
//   final String iconPath, title;
//   final String? subTitle;
//   final String? filldButtonTxt, flatButtonTxt;
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       backgroundColor: Colors.white,
//       child: Container(
//         // margin: EdgeInsets.only(bottom: 60),
//         padding: EdgeInsets.all(
//           24.r,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(iconPath),
//             16.verticalSpace,
//             Text(
//               title,
//               style:
//                   Styles.gilorySimiBold(fontSize: 14, color: AppPallete.black),
//             ),
//             16.verticalSpace,
//             Text(
//               subTitle ?? "",
//               style: Styles.gilorySimiBold(
//                   fontSize: 12, color: AppPallete.lighblack),
//               textAlign: TextAlign.center,
//             ),
//             16.verticalSpace,
//             Row(
//               children: [
//                 filldButtonTxt != null
//                     ? Expanded(
//                         child: CustomButton(
//                           fontSizeBtnTxt: 12,
//                           onPressed: () {},
//                           label: filldButtonTxt!,
//                           buttoncolor: AppPallete.primary,
//                           txtColor: AppPallete.white,
//                         ),
//                       )
//                     : const SizedBox(),
//                 8.horizontalSpace,
//                 flatButtonTxt != null
//                     ? Expanded(
//                         child: CustomButton(
//                           fontSizeBtnTxt: 12,
//                           onPressed: () {},
//                           label: flatButtonTxt!,
//                           buttoncolor: AppPallete.white,
//                           txtColor: AppPallete.filledGrey,
//                           borderColor: AppPallete.borderColor,
//                         ),
//                       )
//                     : const SizedBox()
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
