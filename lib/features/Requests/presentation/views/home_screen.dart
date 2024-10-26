import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theme/colors_manager.dart';
import 'package:task/core/theme/styles.dart';
import 'package:task/core/utils/extensions/widget_extensions.dart';
import 'package:task/features/Auth/presentation/views/login_view.dart';
import 'package:task/features/Requests/data/models/save_requests_response/save_customer_request.dart';
import 'package:task/features/Requests/presentation/views/save_requests_view.dart';
import 'package:task/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(SaveRequestsView.routeName);
            },
            child: ListTile(
              leading: Icon(Icons.add,color: ColorsManager.red, size: 30,),
              title: Text("Creste Request",style: Styles.Rubic500(fontSize: 16, color: ColorsManager.grey),),
              trailing: Icon(Icons.arrow_forward_ios,color: ColorsManager.red, size: 30,),
            
            ),
          ),
          10.verticalSpace,
          ListTile(
            leading: Icon(Icons.search,color: ColorsManager.red, size: 30,),
            title: Text("Search Request",style: Styles.Rubic500(fontSize: 16, color: ColorsManager.grey),),
            trailing: Icon(Icons.arrow_forward_ios,color: ColorsManager.red, size: 30,),

          ),
          10.verticalSpace,
        ],
      ),
    ).withSafeArea();
  }
}