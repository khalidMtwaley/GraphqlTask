// import 'package:flutter/material.dart';

// class TicketPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Layer 1

//     Paint paint_fill_0 = Paint()
//       ..color = const Color.fromARGB(255, 255, 255, 255)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     Path path_0 = Path();
//     path_0.moveTo(size.width, size.height * 0.0040000);
//     path_0.lineTo(size.width * 1.0006250, size.height * 0.2130000);
//     path_0.quadraticBezierTo(size.width * 0.9517500, size.height * 0.2032600,
//         size.width * 0.9514375, size.height * 0.2517600);
//     path_0.quadraticBezierTo(size.width * 0.9523750, size.height * 0.3152600,
//         size.width * 1.0012500, size.height * 0.2997200);
//     path_0.lineTo(size.width * 1.0008125, size.height * 1.0146600);
//     path_0.lineTo(size.width * 0.0012500, size.height * 1.0040000);
//     path_0.lineTo(0, size.height * 0.2997400);
//     path_0.quadraticBezierTo(size.width * 0.0442000, size.height * 0.3067800,
//         size.width * 0.0452125, size.height * 0.2593600);
//     path_0.quadraticBezierTo(size.width * 0.0449375, size.height * 0.2091600,
//         size.width * 0.0018750, size.height * 0.2147800);
//     path_0.lineTo(size.width * 0.0006125, size.height * -0.0043000);

//     canvas.drawPath(path_0, paint_fill_0);

//     // Layer 1

//     Paint paint_stroke_0 = Paint()
//       ..color = AppPallete.grey
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     canvas.drawPath(path_0, paint_stroke_0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
