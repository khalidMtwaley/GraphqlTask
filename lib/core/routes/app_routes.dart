// app_routes.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/features/Auth/presentation/views/login_view.dart';
import 'package:task/features/Requests/presentation/views/create_requests_view.dart';
import 'package:task/features/Requests/presentation/views/request_details_view.dart';
import 'package:task/features/Requests/presentation/views/requests_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    LoginView.routeName: (context) => const LoginView(),
    RequestsView.routeName: (context) => const RequestsView(),
    CreateRequestsView.routeName: (context) => const CreateRequestsView(),
    RequestDetailsView.routeName: (context) => const RequestDetailsView(),
  };
}
