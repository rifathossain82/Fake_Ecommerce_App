import 'dart:io';
import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/routes/routes.dart';
import 'package:fake_ecommerce_app/src/core/theme/app_theme.dart';
import 'package:fake_ecommerce_app/src/core/utils/app_constants.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_scroll_behavior.dart';
import 'package:fake_ecommerce_app/src/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:fake_ecommerce_app/src/features/category/presentation/bloc/category_bloc.dart';
import 'package:fake_ecommerce_app/src/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:fake_ecommerce_app/src/features/on_boarding/presentation/cubits/on_boarding_cubit.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/bloc/product_bloc.dart';
import 'package:fake_ecommerce_app/src/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  /// set transparent status bar for whole app
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  /// injection container
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
        BlocProvider(create: (context) => sl<LoginBloc>()),
        BlocProvider(create: (context) => sl<ProductBloc>()),
        BlocProvider(create: (context) => sl<CategoryBloc>()),
        BlocProvider(create: (context) => sl<UserBloc>()),
        BlocProvider(create: (context) => SettingsCubit()),
      ],
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: KScrollBehavior(),
                child: child!,
              );
            },
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: context.read<SettingsCubit>().isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            initialRoute: RouteGenerator.splash,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
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
