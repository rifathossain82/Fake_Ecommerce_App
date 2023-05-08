import 'dart:async';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/routes/routes.dart';
import 'package:fake_ecommerce_app/src/core/services/local_storage.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_logo.dart';
import 'package:fake_ecommerce_app/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    bool isOnBoardingViewed = await LocalStorage.getData(key: LocalStorageKey.onBoarding) ?? false;
    var token = await LocalStorage.getData(key: LocalStorageKey.token);
    if(!mounted) return;
    if (isOnBoardingViewed) {
      if (token != null) {
        context.pushNamedAndRemoveUntil(RouteGenerator.login);
      } else {
        context.pushNamedAndRemoveUntil(RouteGenerator.login);
      }
    } else {
      context.pushNamedAndRemoveUntil(RouteGenerator.onBoarding);
    }
  }

  @override
  void initState() {
    /// set duration and control what next after splash duration
    setSplashDuration();

    /// set primary color as a status bar color only for splash screen
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: KLogo(),
        ),
      ),
    );
  }
}
