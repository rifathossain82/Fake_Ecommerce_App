import 'dart:io';
import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/routes/routes.dart';
import 'package:fake_ecommerce_app/src/core/theme/app_theme.dart';
import 'package:fake_ecommerce_app/src/core/utils/app_constants.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_scroll_behavior.dart';
import 'package:fake_ecommerce_app/src/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:fake_ecommerce_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:fake_ecommerce_app/src/features/onboarding/presentation/cubits/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingCubit()),
        BlocProvider(create: (context) => DashboardCubit()),
        BlocProvider(create: (context) => sl<HomeBloc>()),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: KScrollBehavior(),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: AppTheme.lightTheme,
        initialRoute: RouteGenerator.splash,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
