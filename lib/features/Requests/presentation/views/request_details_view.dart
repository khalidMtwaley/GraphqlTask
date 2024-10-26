import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/core/di/service_locator.dart';
import 'package:task/core/theme/colors_manager.dart';
import 'package:task/core/theme/styles.dart';
import 'package:task/core/utils/extensions/widget_extensions.dart';
import 'package:task/core/utils/widgets/custom_localized_button_with_icon.dart';
import 'package:task/features/Requests/data/models/all_requests_response/all_requests_response/request_model.dart';
import 'package:task/features/Requests/presentation/blocs/cubit/requests_cubit.dart';
import 'package:task/features/Requests/presentation/views/save_requests_view.dart';

class RequestDetailsView extends StatefulWidget {
  const RequestDetailsView({super.key});
  static const String routeName = '/request-details';
  @override
  State<RequestDetailsView> createState() => _RequestDetailsViewState();
}

class _RequestDetailsViewState extends State<RequestDetailsView> {
  @override
  Widget build(BuildContext context) {
    final request = ModalRoute.of(context)!.settings.arguments as RequestModel;

    return BlocProvider(
      create: (context) => sl.get<RequestsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SaveRequestsView(
                      requestId: request.id,
                      initialPayeeName: request.payeeName,
                      initialNotes: request.notes,
                      initialTypeCode: request.type?.code,
                      initialDeliveryTypeCode: request.deliveryType?.code,
                      initialDate: DateTime.parse(request.date!),
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.edit,
                color: ColorsManager.red,
              ),
            ),
          ],
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
        body: BlocConsumer<RequestsCubit, RequestsState>(
          listener: (context, state) {
            if (state is CancelCustomerRequestSuccess) {
              Fluttertoast.showToast(
                  msg: "Cancelled successfully", backgroundColor: Colors.green);
              Navigator.pop(context);
            } else if (state is CancelCustomerRequestFailed) {
              Fluttertoast.showToast(
                  msg: state.message, backgroundColor: ColorsManager.red);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is CancelCustomerRequestLoading,
              child: Column(
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
                  ),
                  20.verticalSpace,
                  state is! CancelCustomerRequestLoading
                      ? LocalizedElevatedButtonIcon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.red,
                          ),
                          onPressed: () {
                            context.read<RequestsCubit>().cancelCustomerRequest(
                                  id: request.id,
                                  status: "CANCELLED",
                                );
                          },
                          label: Text(
                            "Cancel",
                            style: Styles.ButtomStyle(),
                          ),
                          icon: Icons.cancel,
                        )
                      : SpinKitFadingCircle(
                          color: ColorsManager.red,
                          size: 40.sp,
                        ),
                ],
              ),
            );
          },
        ).paddingHorizontal(20),
      ),
    ).withSafeArea();
  }
}
