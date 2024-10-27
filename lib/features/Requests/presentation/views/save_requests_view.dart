
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:task/core/di/service_locator.dart';
import 'package:task/core/theme/colors_manager.dart';
import 'package:task/core/theme/styles.dart';
import 'package:task/core/utils/extensions/widget_extensions.dart';
import 'package:task/core/utils/widgets/custom_localized_button_with_icon.dart';
import 'package:task/core/utils/widgets/custom_text_form_field.dart';
import 'package:task/core/utils/widgets/validator.dart';
import 'package:task/features/Requests/presentation/blocs/cubit/requests_cubit.dart';
import 'package:task/features/Requests/presentation/views/all_requests_tabBar.dart';
import 'package:task/features/Requests/presentation/widgets/cusom_drop_down.dart';
import 'package:task/features/Requests/presentation/widgets/custom_date_picker.dart';

class SaveRequestsView extends StatefulWidget {
  final int? requestId;
  final String? initialPayeeName;
  final String? initialNotes;
  final String? initialTypeCode;
  final String? initialDeliveryTypeCode;
  final DateTime? initialDate;

  const SaveRequestsView({
    super.key,
    this.requestId,
    this.initialPayeeName,
    this.initialNotes,
    this.initialTypeCode,
    this.initialDeliveryTypeCode,
    this.initialDate,
  });
  static const String routeName = '/create-requests';

  @override
  State<SaveRequestsView> createState() => _SaveRequestsViewState();
}

class _SaveRequestsViewState extends State<SaveRequestsView> {
  final TextEditingController payeeController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController bankNumberController = TextEditingController();
  final TextEditingController walletNumberController = TextEditingController();
  final TextEditingController instaPayNumberController =
      TextEditingController();

  String? selectedTypeCode;
  String? selectedDeliveryTypeCode;
  DateTime? selectedDate;
  final formKey = GlobalKey<FormState>();
  int? bankIndex; 
  final GlobalKey<CustomDropdownState> _deliveryDropdownKey =
      GlobalKey<CustomDropdownState>();

  final List<String> bankNames = [
    "البنك التجاري الدولي",
    "البنك الاهلي المصري",
    "بنك الاسكان والتعمير",
    "بنك الاسكندريه",
    "البنك العربي الافريقي",
    "بنك عوده"
  ];

  @override
  void initState() {
    super.initState();
    payeeController.text = widget.initialPayeeName ?? '';
    noteController.text = widget.initialNotes ?? '';
    selectedTypeCode = widget.initialTypeCode;
    selectedDeliveryTypeCode = widget.initialDeliveryTypeCode;
    selectedDate = widget.initialDate;
  }

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  }

  List<String> getFilteredDeliveryTypes(String? requestType) {
    if (requestType == "PMNT") {
      return ["OFFICE", "DELIVERYAGENT", "WALLET", "BANK", "INSTPY"];
    } else {
      return ["OFFICE", "DELIVERYAGENT"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: BlocProvider(
        create: (context) => sl.get<RequestsCubit>(),
        child: SingleChildScrollView(
          child: BlocConsumer<RequestsCubit, RequestsState>(
            listener: (context, state) {
              if (state is SaveCustomerRequestSuccess ||
                  state is UpdateCustomerRequestSuccess) {
                Fluttertoast.showToast(
                    msg: "Request saved successfully",
                    backgroundColor: Colors.green);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => AllRequestsTabBar(
                          initialCode: selectedTypeCode,
                        )));
              } else if (state is SaveCustomerRequestFailed ||
                  state is UpdateCustomerRequestFailed) {
                Fluttertoast.showToast(
                    msg: "Error", backgroundColor: ColorsManager.red);
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is SaveCustomerRequestLoading ||
                    state is UpdateCustomerRequestLoading,
                child: Form(
                  key: formKey,
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
                          setState(() {
                            selectedTypeCode = value;
                            selectedDeliveryTypeCode = null;
                            bankIndex = null; 
                            _deliveryDropdownKey.currentState
                                ?.setItems(getFilteredDeliveryTypes(value));
                          });
                        },
                      ),
                      SizedBox(height: 10.h),
                      CustomDropdown(
                        key: _deliveryDropdownKey,
                        hintText: "Delivery type",
                        items: getFilteredDeliveryTypes(selectedTypeCode),
                        onItemSelected: (value) {
                          setState(() {
                            selectedDeliveryTypeCode = value;
                          });
                        },
                      ),
                      10.verticalSpace,
                      if (selectedDeliveryTypeCode == "BANK") ...[
                        CustomTextFormField(
                          readonly: true,
                          keyboardType: TextInputType.number,
                          controller: bankNumberController,
                          label: Text("Bank Number"),
                         
                        ),
                        10.verticalSpace,
                        CustomDropdown(
                          hintText: "Select Bank",
                          items: bankNames,
                          onItemSelected: (value) {
                            setState(() {
                              bankIndex = bankNames.indexOf(value!) + 1;
                            });
                          },
                        ),
                      ],
                      if (selectedDeliveryTypeCode == "WALLET")
                        CustomTextFormField(
                          readonly: true,
                          controller: walletNumberController,
                          label: Text("Wallet Number"),
                        ),
                      if (selectedDeliveryTypeCode == "INSTPY")
                        CustomTextFormField(
                          readonly: true,
                          prefix: const Icon(
                            Icons.credit_card,
                            color: ColorsManager.grey,
                          ),
                          controller: instaPayNumberController,
                          label: Text("Insta Pay Number"),
                        ),
                      10.verticalSpace,
                      CustomTextFormField(
                        validator: (value) {
                          if (Validator.validateNotEmpty(value) != null) {
                            return "Field is empty";
                          }
                          return null;
                        },
                        controller: payeeController,
                        label: Text("Payee name"),
                      ),
                      10.verticalSpace,
                      CustomTextFormField(
                        validator: (value) {
                          if (Validator.validateNotEmpty(value) != null) {
                            return "Field is empty";
                          }
                          return null;
                        },
                        label: Text("Notes"),
                        controller: noteController,
                        maxLines: 10,
                      ),
                      20.verticalSpace,
                      state is! SaveCustomerRequestLoading &&
                              state is! UpdateCustomerRequestLoading
                          ? LocalizedElevatedButtonIcon(
                              onPressed: () {
                                if (formKey.currentState!.validate() &&
                                    selectedDate != null &&
                                    selectedTypeCode != null &&
                                    selectedDeliveryTypeCode != null) {
                                  final formattedDate =
                                      formatDate(selectedDate!);

                                  if (widget.requestId != null) {
                                    context
                                        .read<RequestsCubit>()
                                        .updateCustomerRequest(

                                          id: widget.requestId,
                                          date: formattedDate,
                                          payeeName: payeeController.text,
                                          notes: noteController.text,
                                          deliveryTypeCode:
                                              selectedDeliveryTypeCode,
                                          typeCode: selectedTypeCode,
                                          // bankIndex: bankIndex, // Pass bank index
                                        );
                                  } else {
                                    context
                                        .read<RequestsCubit>()
                                        .saveCustomerRequest(
                                          bankId: bankIndex,
                                          accountNumber: bankNumberController.text,
                                          date: formattedDate,
                                          payeeName: payeeController.text,
                                          notes: noteController.text,
                                          deliveryTypeCode:
                                              selectedDeliveryTypeCode,
                                          typeCode: selectedTypeCode,
                                          // bankIndex: bankIndex, // Pass bank index
                                        );
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Please fill in all fields",
                                    backgroundColor: ColorsManager.red,
                                  );
                                }
                              },
                              label: Text("Save", style: Styles.ButtomStyle()),
                              icon: Icons.check_circle,
                            )
                          : SpinKitFadingCircle(
                              color: ColorsManager.red,
                              size: 40.sp,
                            ),
                    ],
                  ),
                ),
              );
            },
          ).paddingHorizontal(20),
        ),
      ),
    ).withSafeArea();
  }
}
