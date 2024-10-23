// app_routes.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/features/Auth/presentation/views/login_view.dart';
import 'package:task/features/Requests/presentation/views/save_requests_view.dart';
import 'package:task/features/Requests/presentation/views/request_details_view.dart';
import 'package:task/features/Requests/presentation/views/all_requests_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    LoginView.routeName: (context) => const LoginView(),
    AllRequestsView.routeName: (context) => const AllRequestsView(),
    SaveRequestsView.routeName: (context) => const SaveRequestsView(),
    RequestDetailsView.routeName: (context) => const RequestDetailsView(),
  };
}
