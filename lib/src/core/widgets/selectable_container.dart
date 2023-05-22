import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:flutter/material.dart';

class SelectableContainer extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final Widget child;
  final double height;
  final double? width;
  final EdgeInsets? padding;
  final double borderRadius;
  final Color? selectedBgColor;
  final Color? unSelectedBgColor;
  final Color? selectedBorderColor;
  final Color? unSelectedBorderColor;

  const SelectableContainer({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.child,
    this.height = 40,
    this.width,
    this.padding,
    this.borderRadius = 8,
    this.selectedBgColor,
    this.unSelectedBgColor,
    this.selectedBorderColor,
    this.unSelectedBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          color: isSelected
              ? selectedBgColor ?? context.primaryColor
              : unSelectedBgColor ?? kWhite,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: isSelected
                ? selectedBorderColor ?? Colors.transparent
                : unSelectedBorderColor ?? context.primaryColor,
            width: 1,
          ),
        ),
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
