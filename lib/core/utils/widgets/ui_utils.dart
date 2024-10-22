// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class UIUtils {
//   static void showLoading(BuildContext context) => showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (_) => PopScope(
//           canPop: false,
//           child: AlertDialog(
//             content: SizedBox(
//               height: MediaQuery.of(context).size.height * 0.2,
//               child: const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   LoadingIndicator(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );

//   static void hideLoading(BuildContext context) => Navigator.of(context).pop();

//   static void showMessage(String message) {
//     Fluttertoast.showToast(
//       msg: message = "something went wrong",
//       toastLength: Toast.LENGTH_SHORT,
//     );
//   }
// }
