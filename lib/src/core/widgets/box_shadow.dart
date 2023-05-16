import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:flutter/cupertino.dart';

class KBoxShadow {
  static BoxShadow containerShadow() {
    return BoxShadow(
      offset: const Offset(0.0, 3.0),
      spreadRadius: 0,
      blurRadius: 4,
      color: kItemShadowColor,
    );
  }
}
