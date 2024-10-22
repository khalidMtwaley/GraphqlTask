import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:task/core/bloc_observer/app_bloc_observer.dart';
import 'package:task/core/di/service_locator.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task/core/routes/app_routes.dart';
import 'package:task/features/Auth/presentation/blocs/cubit/auth_cubit.dart';
import 'package:task/features/Auth/presentation/views/login_view.dart';
import 'package:task/features/Requests/presentation/blocs/cubit/requests_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('cacheBox');

  await configureDependencies();

  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.get<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => sl.get<RequestsCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: Builder(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: AppRoutes.routes,
            initialRoute: LoginView.routeName,
          );
        }),
      ),
    );
  }
}
