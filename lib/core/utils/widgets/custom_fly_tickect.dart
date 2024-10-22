// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:quon_app/core/theme/app_pallete.dart';
// import 'package:quon_app/core/theme/styles.dart';
// import 'package:quon_app/core/utils/extensions/widget_extensions.dart';
// import 'package:quon_app/core/utils/widgets/cutsom_simi_circle.dart';
// import 'package:quon_app/features/flight_flow/data/models/ticket_model.dart';
// import 'package:quon_app/features/flight_flow/presentation/widgets/ticket_widget_content.dart';

// class TicketWidget extends StatelessWidget {
//   const TicketWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.topCenter,
//       children: [
//         Container(
//           width: 300.w,
//           padding: const EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//               border: Border.all(color: AppPallete.blueLight),
//               borderRadius: BorderRadius.circular(4)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Fly',
//                       style: Styles.gilorySimiBold(
//                           fontSize: 16, color: AppPallete.black)),
//                   Column(
//                     children: [
//                       Text('SAR',
//                           style: Styles.gilorySimiBold(
//                               fontSize: 16, color: AppPallete.black)),
//                       Text('+0',
//                           style: Styles.gilorySimiBold(
//                               fontSize: 16, color: AppPallete.black)),
//                     ],
//                   ),
//                 ],
//               ),
//               16.verticalSpace,
//               const DottedLine(),
//               const SizedBox(height: 8.0),
//               ListView.separated(
//                 // physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: ticketMidelList.length,
//                 itemBuilder: (context, index) {
//                   return TicketWidgetContent(
//                     ticketModel: ticketMidelList[index],
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return 8.verticalSpace;
//                 },
//               ),
//             ],
//           ),
//         ).paddingTop(16),
//         const CustomSimiCircle(
//           left: -10,
//         ),
//         const CustomSimiCircle(
//           right: -10,
//         )
//       ],
//     );
//   }
// }
