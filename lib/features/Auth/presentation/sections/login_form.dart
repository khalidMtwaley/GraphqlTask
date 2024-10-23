import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task/core/theme/colors_manager.dart';
import 'package:task/core/theme/styles.dart';
import 'package:task/core/utils/extensions/widget_extensions.dart';
import 'package:task/core/utils/widgets/custom_localized_button_with_icon.dart';
import 'package:task/core/utils/widgets/custom_text_form_field.dart';
import 'package:task/features/Auth/presentation/blocs/cubit/auth_cubit.dart';
import 'package:task/features/Auth/presentation/blocs/cubit/auth_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/features/Requests/presentation/views/save_requests_view.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSucces) {
          Fluttertoast.showToast(
            msg: "Login Successful!",
            backgroundColor: Colors.green,
          );
          Navigator.of(context)
              .pushReplacementNamed(SaveRequestsView.routeName);
        } else if (state is LoginError) {
          Fluttertoast.showToast(
            // msg: "invalid username or password",
            msg: state.message,
            backgroundColor: ColorsManager.red,
          );
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is LoginLoading,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                60.verticalSpace,
                CustomTextFormField(
                  prefix: const Icon(
                    Icons.person,
                    color: ColorsManager.grey,
                  ),
                  label: const Text("UserName/Email"),
                  controller: _userController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username or email';
                    }
                    return null;
                  },
                ),
                10.verticalSpace,
                CustomTextFormField(
                  prefix: const Icon(
                    Icons.key,
                    color: ColorsManager.grey,
                  ),
                  isPassword: true,
                  label: const Text("Password"),
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                20.verticalSpace,
                state is! LoginLoading
                    ? LocalizedElevatedButtonIcon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.red,
                        ),
                        icon: Icons.lock_open,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().login(
                                  username: _userController.text,
                                  password: _passwordController.text,
                                );
                          }
                        },
                        label: Text(
                          "Login",
                          style: Styles.ButtomStyle(),
                        ),
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
    );
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
