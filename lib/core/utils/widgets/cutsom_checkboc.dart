// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomCheckboxWidget extends StatelessWidget {
//   final CustomCheckboxModel checkboxModel;
//   final ValueChanged<bool?> onChanged;
//   final OutlinedBorder? shape;
//   final bool isChecked;

//   const CustomCheckboxWidget({
//     super.key,
//     required this.checkboxModel,
//     required this.onChanged,
//     this.shape,
//     required this.isChecked,
//   });

//   @override
//   Widget build(BuildContext context) {

//     return Row(
//       children: [
//         Checkbox(
//             splashRadius: 10,
//             shape: shape,
//             value: isChecked,
//             onChanged: onChanged,
//             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             visualDensity: VisualDensity.compact),
//         SizedBox(
//           width: 250.w,
//           child: Text(
//             checkboxModel.title,
//             style: Styles.giloryMeduiem(fontSize: 14, color: AppPallete.black),
//             overflow: TextOverflow.fade,
//             maxLines: null,
//           ),
//         )
//       ],
//     );
//   }
// }
