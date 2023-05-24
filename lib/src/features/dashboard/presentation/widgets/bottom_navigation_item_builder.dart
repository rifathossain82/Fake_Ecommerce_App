import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:flutter/material.dart';

class BottomNavigationItemBuilder extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String name;
  final IconData icon;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final double borderRadius;
  final Color? selectedBorderColor;
  final Color? unSelectedBorderColor;

  const BottomNavigationItemBuilder({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.name,
    required this.icon,
    this.margin,
    this.height,
    this.width,
    this.borderRadius = 8,
    this.selectedBorderColor,
    this.unSelectedBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          margin: margin,
          decoration: BoxDecoration(
            color: isSelected
                ? context.isDark
                    ? kWhite.withOpacity(0.1)
                    : context.primaryColor.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected
                    ? context.isDark
                        ? kWhite
                        : context.primaryColor
                    : kBlueGrey,
              ),
              const SizedBox(width: 6),
              Text(
                name,
                textAlign: TextAlign.center,
                style: context.textTheme.titleSmall?.copyWith(
                  color: isSelected
                      ? context.isDark
                          ? kWhite
                          : context.primaryColor
                      : kBlueGrey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
