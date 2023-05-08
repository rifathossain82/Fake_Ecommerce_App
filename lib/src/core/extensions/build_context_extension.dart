import 'dart:math';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  void unFocusKeyboard() => FocusScope.of(this).unfocus();

  dynamic get getArguments => ModalRoute.of(this)?.settings.arguments;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  Size get screenSize => MediaQuery.of(this).size;

  double get minScreenSize =>
      min(MediaQuery.of(this).size.height, MediaQuery.of(this).size.width);

  double get maxScreenSize =>
      max(MediaQuery.of(this).size.height, MediaQuery.of(this).size.width);

  Future push(Widget nextPage) => Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
      );

  Future pushReplacement(Widget nextPage) => Navigator.pushReplacement(
        this,
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
      );

  Future pushAndRemoveUntil(Widget nextPage) => Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
        (route) => false,
      );

  Future pushNamed(String routeName) => Navigator.pushNamed(
        this,
        routeName,
      );

  Future pushReplacementNamed(String routeName) =>
      Navigator.pushReplacementNamed(
        this,
        routeName,
      );

  Future pushNamedAndRemoveUntil(String routeName) =>
      Navigator.pushNamedAndRemoveUntil(
        this,
        routeName,
        (route) => false,
      );
}
