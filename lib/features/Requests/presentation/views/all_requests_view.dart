import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routes/app_routes.dart';
import 'package:task/core/theme/colors_manager.dart';
import 'package:task/core/theme/styles.dart';
import 'package:task/features/Requests/data/models/requests_response/save_customer_request.dart';
import 'package:task/features/Requests/presentation/views/request_details_view.dart';

class AllRequestsView extends StatelessWidget {
  const AllRequestsView({super.key});
  static const String routeName = '/requests';

  @override
  Widget build(BuildContext context) {
    final List<SaveCustomerRequest>? requests = ModalRoute.of(context)!
        .settings
        .arguments as List<SaveCustomerRequest>?;

    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Requests",
          style: Styles.Rubic400(fontSize: 16, color: ColorsManager.red),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: ColorsManager.red),
        ),
      ),
      body: requests != null && requests.isNotEmpty
          ? ListView.builder(
              itemCount: requests.length,
              itemBuilder: (context, index) {
                final request = requests[index];
                return Container(
                    margin: EdgeInsets.all(10.w),
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: ColorsManager.darkGrey,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            RequestDetailsView.routeName,
                            arguments: request);
                      },
                      child: ListTile(
                        trailing: Text(
                          request.date!.substring(0, 10),
                          style: Styles.Rubic400(
                            fontSize: 12.sp,
                            color: ColorsManager.grey,
                          ),
                        ),
                        leading: Column(
                          children: [
                            Text(
                              request.id.toString(),
                              style: Styles.Rubic400(
                                fontSize: 12.sp,
                                color: ColorsManager.grey,
                              ),
                            ),
                            Text(
                              request.status?.name ?? '',
                              style: Styles.Rubic400(
                                fontSize: 12.sp,
                                color: ColorsManager.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
           
                    );
              },
            )
          : Center(
              child: Text(
                'No requests found',
                style: TextStyle(color: ColorsManager.red, fontSize: 18),
              ),
            ),
    );
  }
}
