import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task/core/theme/colors_manager.dart';
import 'package:task/core/utils/extensions/widget_extensions.dart';
import 'package:task/features/Auth/presentation/sections/login_form.dart';

class LoginView extends StatefulWidget {
  static const String routeName = '/login';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: const Center(
        child: LoginForm(),
      ).paddingHorizontal(20),
    ).withSafeArea();
  }
}
