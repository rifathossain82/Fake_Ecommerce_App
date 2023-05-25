import 'package:fake_ecommerce_app/src/features/auth/login/presentation/pages/login_page.dart';
import 'package:fake_ecommerce_app/src/features/auth/register/presentation/pages/register_page.dart';
import 'package:fake_ecommerce_app/src/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:fake_ecommerce_app/src/features/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:fake_ecommerce_app/src/features/settings/presentation/pages/settings_page.dart';
import 'package:fake_ecommerce_app/src/features/splash/presentation/pages/splash_page.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/pages/add_or_update_user_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String settings = '/settings';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: routeSettings,
        );
      case onBoarding:
        return MaterialPageRoute(
          builder: (_) => OnBoardingPage(),
          settings: routeSettings,
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: routeSettings,
        );
      case register:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
          settings: routeSettings,
        );
      case dashboard:
        return MaterialPageRoute(
          builder: (_) => DashboardPage(),
          settings: routeSettings,
        );
      case settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
          settings: routeSettings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: routeSettings,
        );
    }
  }
}
