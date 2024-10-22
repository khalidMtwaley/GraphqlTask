import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theme/colors_manager.dart';
import 'package:task/core/theme/styles.dart';
import 'package:task/core/utils/extensions/widget_extensions.dart';
import 'package:task/features/Requests/data/models/requests_response/save_customer_request.dart';

class RequestDetailsView extends StatefulWidget {
  const RequestDetailsView({super.key});
  static const String routeName = '/request-details';
  @override
  State<RequestDetailsView> createState() => _RequestDetailsViewState();
}

class _RequestDetailsViewState extends State<RequestDetailsView> {
  @override
  Widget build(BuildContext context) {
    final request =
        ModalRoute.of(context)!.settings.arguments as SaveCustomerRequest;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Request details",
          style: Styles.Rubic400(
            fontSize: 16,
            color: ColorsManager.red,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorsManager.red,
            )),
      ),
      backgroundColor: ColorsManager.black,
      body: Column(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Request: ', 
                  style: Styles.Rubic400(
                    fontSize: 16.sp,
                    color: ColorsManager.grey,
                  ),
                ),
                TextSpan(
                  text: request.id.toString(), 
                  style: Styles.Rubic400(
                    fontSize: 16.sp,
                    color: ColorsManager.red,
                  ),
                ),
              ],
            ),
          ),
          30.verticalSpace,
          Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: ColorsManager.darkGrey,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "status",
                      style: Styles.Rubic400(
                          fontSize: 14, color: ColorsManager.grey),
                    ),
                    Text(
                      request.status?.name ?? "",
                      style: Styles.Rubic400(
                          fontSize: 14, color: ColorsManager.grey),
                    ),
                    10.verticalSpace,
                    Text(
                      "Date",
                      style: Styles.Rubic400(
                          fontSize: 14, color: ColorsManager.grey),
                    ),
                    3.verticalSpace,
                    Text(
                      request.date!.substring(0, 10),
                      style: Styles.Rubic400(
                          fontSize: 14, color: ColorsManager.grey),
                    ),
                    10.verticalSpace,
                    Text(
                      "Deilevery type",
                      style: Styles.Rubic400(
                          fontSize: 14, color: ColorsManager.grey),
                    ),
                    3.verticalSpace,
                    Text(
                      request.deliveryType?.name ?? "",
                      style: Styles.Rubic400(
                          fontSize: 14, color: ColorsManager.grey),
                    ),
                    12.verticalSpace,
                    Text(
                      "notes",
                      style: Styles.Rubic400(
                          fontSize: 14, color: ColorsManager.grey),
                    ),
                    3.verticalSpace,
                    Text(
                      request.notes ?? "",
                      style: Styles.Rubic400(
                          fontSize: 14, color: ColorsManager.grey),
                    ),
                    12.verticalSpace,
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "payee name",
                      style: Styles.Rubic400(
                          fontSize: 14, color: ColorsManager.grey),
                    ),
                    Text(
                      request.payeeName ?? "",
                      style: Styles.Rubic400(
                          fontSize: 14, color: ColorsManager.grey),
                    ),
                    12.verticalSpace,
                    Text(
                      "request type",
                      style: Styles.Rubic400(
                          fontSize: 14, color: ColorsManager.grey),
                    ),
                    3.verticalSpace,
                    Text(
                      request.type?.name ?? "",
                      style: Styles.Rubic400(
                          fontSize: 14, color: ColorsManager.grey),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ).paddingHorizontal(20),
    ).withSafeArea();
  }
}
