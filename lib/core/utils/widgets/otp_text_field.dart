// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:plus3/core/theme/app_pallete.dart';

// class OtpTextfieldd extends StatelessWidget {
//   const OtpTextfieldd({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return OtpTextField(
//       decoration: const InputDecoration(
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: AppPallete.black)),
//           disabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: AppPallete.black))),
//       numberOfFields: 4,
//       //set to true to show as box or false to show as dash
//       showFieldAsBox: true,
//       fieldHeight: 52.h,
//       fieldWidth: 52.w,
//       margin: EdgeInsets.symmetric(horizontal: 9),
//       onCodeChanged: (String code) {
//         //handle validation or checks here
//       },
//       //runs when every textfield is filled
//       onSubmit: (String verificationCode) {
//         // showDialog(
//         //     context: context,
//         //     builder: (context) {
//         //       return SizedBox();
//         //       // return AlertDialog(
//         //       //     title: Text("Verification Code"),
//         //       //     content: Text('Code entered is $verificationCode'),
//         //       // );
//         //     });
//       },
//     );
//   }
// }
