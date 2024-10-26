import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theme/colors_manager.dart';
import 'package:task/core/utils/extensions/widget_extensions.dart';
import 'package:task/features/Auth/presentation/views/login_view.dart';
import 'package:task/features/Requests/data/models/all_requests_response/all_requests_response/request_model.dart';
import 'package:task/features/Requests/presentation/views/request_details_view.dart';

class NewRequestItem extends StatelessWidget {
  const NewRequestItem({super.key, required this.requesst});
  final RequestModel requesst;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RequestDetailsView.routeName, arguments: requesst);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    requesst.id?.toString() ?? "null",
                    style: TextStyle(
                      color: ColorsManager.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                  7.verticalSpace,
                  Text(
                    requesst.status!.name ?? "null",
                    style: TextStyle(
                      color: ColorsManager.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Text(
                requesst.date?.substring(0, 10) ?? "",
                style: TextStyle(
                  color: ColorsManager.grey,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: .3,
            color: ColorsManager.grey,
          )
        ],
      ).paddingHorizontal(10),
    );
  }
}
