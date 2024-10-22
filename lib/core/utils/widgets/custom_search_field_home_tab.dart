// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:plus3/core/theme/app_pallete.dart';
// import 'package:plus3/core/theme/styles.dart';
// import 'package:plus3/core/utils/assets/images.dart';
// import 'package:plus3/features/auth/presentaion/views/notification_view.dart';
// import 'package:plus3/generated/l10n.dart';

// class CustomSearchFieldWidgetHometab extends StatefulWidget {
//   CustomSearchFieldWidgetHometab({super.key, this.hintText, this.onChanged});

//   final String? hintText;
//   final ValueChanged<String>? onChanged;

//   @override
//   _CustomSearchFieldWidgetHometabState createState() =>
//       _CustomSearchFieldWidgetHometabState();
// }

// class _CustomSearchFieldWidgetHometabState
//     extends State<CustomSearchFieldWidgetHometab> {
//   final TextEditingController searchController = TextEditingController();
//   final FocusNode _focusNode = FocusNode();
//   bool _isFocused = false;

//   @override
//   void initState() {
//     super.initState();

//     _focusNode.addListener(() {
//       setState(() {
//         _isFocused = _focusNode.hasFocus;
//       });
//     });

//     searchController.addListener(() {
//       if (widget.onChanged != null) {
//         widget.onChanged!(searchController.text);
//       }
//     });
//   }

//   @override
//   // void dispose() {
//   //   _focusNode.dispose();
//   //   searchController.dispose();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final tr = S();

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width * 0.7,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4.r),
//             gradient: _isFocused
//                 ? const LinearGradient(
//                     colors: [Color(0xFFE684AE), Color(0xFF79CBCA)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   )
//                 : null,
//             border: Border.all(
//               color: _isFocused ? Colors.transparent : Colors.transparent,
//             ),
//           ),
//           child: TextField(
//             controller: searchController,
//             focusNode: _focusNode,
//             decoration: InputDecoration(
//               contentPadding:
//                   EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
//               prefixIcon: Padding(
//                 padding: EdgeInsets.only(left: 15.w, right: 10.w),
//                 child: SvgPicture.asset(
//                   Assets.iconsSearch,
//                   width: 20.w,
//                   height: 20.h,
//                   fit: BoxFit.scaleDown,
//                 ),
//               ),
//               hintText: widget.hintText ?? tr.searchforcofeeresturant,
//               hintStyle: Styles.Alexandrianormal400(
//                 fontSize: 14.sp,
//                 color: AppPallete.grey2,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(4.r),
//                 borderSide: BorderSide.none,
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(4.r),
//                 borderSide: BorderSide.none,
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(4.r),
//                 borderSide: BorderSide.none,
//               ),
//               filled: true,
//               fillColor: _isFocused ? Colors.white : Color(0xFFD9E2E8),
//             ),
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: AppPallete.brown),
//           ),
//           child: IconButton(
//             onPressed: () {
//               Navigator.of(context).pushNamed(NotificationView.routeName);
//             },
//             icon: SvgPicture.asset(Assets.iconsNotifications),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }
// }
