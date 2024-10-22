
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:task/core/routes/app_routes.dart';
import 'package:task/core/theme/colors_manager.dart';
import 'package:task/core/theme/styles.dart';
import 'package:task/core/utils/extensions/widget_extensions.dart';
import 'package:task/core/utils/widgets/custom_localized_button_with_icon.dart';
import 'package:task/core/utils/widgets/custom_text_form_field.dart';
import 'package:task/features/Requests/presentation/blocs/cubit/requests_cubit.dart';
import 'package:task/features/Requests/presentation/views/request_details_view.dart';
import 'package:task/features/Requests/presentation/widgets/cusom_drop_down.dart';
import 'package:task/features/Requests/presentation/widgets/custom_date_picker.dart';

class CreateRequestsView extends StatefulWidget {
  const CreateRequestsView({super.key});
  static const String routeName = '/create-requests';

  @override
  State<CreateRequestsView> createState() => _CreateRequestsViewState();
}

class _CreateRequestsViewState extends State<CreateRequestsView> {
  final TextEditingController payeeController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  
  String? selectedTypeCode;
  String? selectedDeliveryTypeCode;
  DateTime? selectedDate;

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: SingleChildScrollView(
        child: BlocConsumer<RequestsCubit, RequestsState>(
          listener: (context, state) {
            if (state is SaveCustomerRequestSuccess) {
              Fluttertoast.showToast(
                  msg: "Saved successfully", backgroundColor: Colors.green);
              Navigator.of(context).pushNamed(RequestDetailsView.routeName, arguments: state.RequestDeatails);
            } else if (state is SaveCustomerRequestFailed) {
              Fluttertoast.showToast(
                  msg: state.message, backgroundColor: ColorsManager.red);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is SaveCustomerRequestLoading,
              child: Column(
                children: [
                  40.verticalSpace,
                  
                  CustomCalendarDatePicker(
                    onDateSelected: (date) {
                      selectedDate = date; 
                    },
                  ),

                  10.verticalSpace,
                  
                  CustomDropdown(
                    hintText: "Request type",
                    items: ["PMNT", "RTRN", "MTRL"],
                    onItemSelected: (value) {
                      selectedTypeCode = value; 
                    },
                  ),
                  
                  10.verticalSpace,
                  
                  CustomDropdown(
                    
                    hintText: "Delivery type",
                    items: ["OFFICE", "DELIVERYAGENT", "WALLET", "BANK", "INSTPY"],
                    onItemSelected: (value) {
                      selectedDeliveryTypeCode = value; 
                    },
                  ),
                  
                  10.verticalSpace,
                  CustomTextFormField(
                    controller: payeeController,
                    label: Text("Payee name"),
                  ),
                  
                  10.verticalSpace,
                  CustomTextFormField(
                    label: Text("Notes"),
                    controller: noteController,
                    maxLines: 10,
                  ),
                  
                  20.verticalSpace,
                  state is! SaveCustomerRequestLoading
                      ? LocalizedElevatedButtonIcon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.red,
                          ),
                          onPressed: () {
                            if (selectedDate != null && selectedTypeCode != null && selectedDeliveryTypeCode != null) {
                              final formattedDate = formatDate(selectedDate!);

                              context.read<RequestsCubit>().saveCustomerRequest(
                                    notes: noteController.text,
                                    payeeName: payeeController.text,
                                    typeCode: selectedTypeCode,
                                    date: formattedDate,
                                    deliveryTypeCode: selectedDeliveryTypeCode,
                                  );
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please fill in all fields", backgroundColor: ColorsManager.red);
                            }
                          },
                          label: Text(
                            "Save",
                            style: Styles.ButtomStyle(),
                          ),
                          icon: Icons.check_circle,
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
