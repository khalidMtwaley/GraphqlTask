// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SearchCustomAppBar extends StatelessWidget
//     implements PreferredSizeWidget {
//   final VoidCallback? onLeadingPressed;
//   final Widget? title;
//   final List<Widget>? actions;
//   final Color? backgroundColor;
//   final bool isCenter;
//   final Widget? leading;

//   SearchCustomAppBar({
//     this.isCenter = true,
//     this.onLeadingPressed,
//     this.title,
//     this.actions,
//     this.backgroundColor = Colors.transparent,
//     this.leading,
//   });

//   @override
//   Widget build(BuildContext context) {
//     bool isRtl = Directionality.of(context) == TextDirection.rtl;

//     return AppBar(
//       centerTitle: isCenter,
//       backgroundColor: backgroundColor,
//       leading: leading ??
//           Container(
//             margin: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               border: Border.all(color: AppPallete.brown),
//             ),
//             child: Transform(
//               alignment: Alignment.center,
//               transform:
//                   isRtl ? Matrix4.rotationY(0) : Matrix4.rotationY(3.14159),
//               child: IconButton(
//                 icon: SvgPicture.asset(Assets.iconsAppbarleading),
//                 onPressed: onLeadingPressed ??
//                     () {
//                       Navigator.of(context)
//                           .pushReplacementNamed(Hometab.routeName);
//                     },
//               ),
//             ),
//           ),
//       title: title,
//       titleTextStyle:
//           Styles.Alexandrianormal500(fontSize: 16, color: Colors.black),
//       actions: actions,
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
