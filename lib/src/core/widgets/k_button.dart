import 'package:flutter/material.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';

class KButton extends StatelessWidget {
  const KButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.borderRadius,
    this.bgColor,
    this.height,
    this.width,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget child;
  final double? borderRadius;
  final Color? bgColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
      ),
      color: bgColor ?? kLightPrimaryColor,
      height: height ?? 42,
      minWidth: width ?? context.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      elevation: 0,
      child: child,
    );
  }
}
