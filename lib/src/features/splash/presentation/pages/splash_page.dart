import 'dart:async';
import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/routes/routes.dart';
import 'package:fake_ecommerce_app/src/core/services/local_storage.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_logo.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {

  setSplashDuration() async {
    return Timer(
      const Duration(seconds: 3),
      () => pageNavigation(),
    );
  }

  void pageNavigation() async {
    final localStorage = sl<LocalStorage>();
    bool isOnBoardingViewed = localStorage.getData(key: LocalStorageKey.onBoarding) ?? false;
    var token = localStorage.getData(key: LocalStorageKey.token);
    if (!mounted) return;
    if (isOnBoardingViewed) {
      if (token != null) {
        context.pushNamedAndRemoveUntil(routeName: RouteGenerator.dashboard);
      } else {
        context.pushNamedAndRemoveUntil(routeName: RouteGenerator.login);
      }
    } else {
      context.pushNamedAndRemoveUntil(routeName: RouteGenerator.onBoarding);
    }
  }

  @override
  void initState() {
    /// set duration and control what next after splash duration
    setSplashDuration();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: const SafeArea(
        child: Center(
          child: KLogo(),
        ),
      ),
    );
  }
}
