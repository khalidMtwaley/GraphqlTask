// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:plus3/core/theme/app_pallete.dart';
// // import 'package:plus3/core/theme/styles.dart';
// // import 'package:plus3/core/utils/assets/images.dart';
// // import 'package:plus3/features/auth/presentaion/views/notification_view.dart';
// // import 'package:plus3/generated/l10n.dart';

// // class CustomSearchFieldWidgetSearchTab extends StatefulWidget {
// //   CustomSearchFieldWidgetSearchTab({super.key, this.hintText, this.onChanged});

// //   final String? hintText;
// //   final ValueChanged<String>? onChanged;

// //   @override
// //   _CustomSearchFieldWidgetSearchTabState createState() =>
// //       _CustomSearchFieldWidgetSearchTabState();
// // }

// // class _CustomSearchFieldWidgetSearchTabState
// //     extends State<CustomSearchFieldWidgetSearchTab> {
// //   final TextEditingController searchController = TextEditingController();
// //   final FocusNode _focusNode = FocusNode();
// //   bool _isFocused = false;

// //   @override
// //   void initState() {
// //     super.initState();

// //     _focusNode.addListener(() {
// //       setState(() {
// //         _isFocused = _focusNode.hasFocus;
// //       });
// //     });

// //     searchController.addListener(() {
// //       if (widget.onChanged != null) {
// //         widget.onChanged!(searchController.text);
// //       }
// //     });
// //   }

// //   @override
// //   @override
// //   Widget build(BuildContext context) {
// //     final tr = S();

// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceAround,
// //       children: [
// //         Container(
// //           width: MediaQuery.of(context).size.width * 0.7,
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(4.r),
// //             gradient: _isFocused
// //                 ? const LinearGradient(
// //                     colors: [Color(0xFFE684AE), Color(0xFF79CBCA)],
// //                     begin: Alignment.topLeft,
// //                     end: Alignment.bottomRight,
// //                   )
// //                 : null,
// //             border: Border.all(
// //               color: _isFocused ? Colors.transparent : Colors.transparent,
// //             ),
// //           ),
// //           child: TextField(
// //             controller: searchController,
// //             focusNode: _focusNode,
// //             decoration: InputDecoration(
// //               contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
// //               prefixIcon: Padding(
// //                 padding: EdgeInsets.only(left: 15.w, right: 10.w),
// //                 child: SvgPicture.asset(
// //                   Assets.iconsSearch,
// //                   width: 20.w,
// //                   height: 20.h,
// //                   fit: BoxFit.scaleDown,
// //                 ),
// //               ),
// //               hintText: widget.hintText ?? tr.searchforcofeeresturant,
// //               hintStyle: Styles.Alexandrianormal400(
// //                 fontSize: 14.sp,
// //                 color: AppPallete.grey2,
// //               ),
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(4.r),
// //                 borderSide: BorderSide.none,
// //               ),
// //               enabledBorder: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(4.r),
// //                 borderSide: BorderSide.none,
// //               ),
// //               focusedBorder: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(4.r),
// //                 borderSide: BorderSide.none,
// //               ),
// //               filled: true,
// //               fillColor: _isFocused ? Colors.white : Color(0xFFD9E2E8),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     searchController.dispose();
// //     super.dispose();
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:plus3/core/theme/app_pallete.dart';
// import 'package:plus3/core/theme/styles.dart';
// import 'package:plus3/core/utils/assets/images.dart';
// import 'package:plus3/features/home/presentaion/views/home_screen_view.dart';
// import 'package:plus3/features/home/presentaion/views/home_tab.dart';
// import 'package:plus3/generated/l10n.dart';

// class CustomSearchFieldWidgetSearchTab extends StatefulWidget {
//   CustomSearchFieldWidgetSearchTab({super.key, this.hintText, this.onChanged});

//   final String? hintText;
//   final ValueChanged<String>? onChanged;

//   @override
//   _CustomSearchFieldWidgetSearchTabState createState() =>
//       _CustomSearchFieldWidgetSearchTabState();
// }

// class _CustomSearchFieldWidgetSearchTabState
//     extends State<CustomSearchFieldWidgetSearchTab> {
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
//       setState(
//           () {}); // Trigger rebuild to toggle between search and close icons
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final tr = S();
//     bool isRtl = Directionality.of(context) == TextDirection.rtl;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width * 0.72,
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
//               contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
//               prefixIcon: Padding(
//                 padding: EdgeInsets.only(left: 15.w, right: 10.w),
//                 child: SvgPicture.asset(
//                   Assets.iconsSearch,
//                   width: 20.w,
//                   height: 20.h,
//                   fit: BoxFit.scaleDown,
//                 ),
//               ),
//               suffixIcon: searchController.text.isNotEmpty
//                   ? IconButton(
//                       icon: Icon(
//                         Icons.close,
//                         color: AppPallete.dottedborderRed,
//                       ),
//                       onPressed: () {
//                         searchController.clear(); // Clear the search field
//                         setState(
//                             () {}); // Rebuild the widget to switch back to search icon
//                       },
//                     )
//                   : null,
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
//           margin: EdgeInsets.all(5),
//           decoration:
//               BoxDecoration(border: Border.all(color: AppPallete.brown)),
//           child: Transform(
//             alignment: Alignment.center,
//             transform:
//                 isRtl ? Matrix4.rotationY(3.14159) : Matrix4.rotationY(0),
//             child: IconButton(
//                 icon: SvgPicture.asset(Assets.iconsAppbarleading),
//                 onPressed: () {
//                   Navigator.of(context).pushNamed(HomeScreenView.routeName);
//                 }),
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
