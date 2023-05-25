import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final MainAxisAlignment mainAxisAlignment;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;

  const RowText({
    Key? key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.paddingTop = 0,
    this.paddingBottom = 0,
    this.paddingLeft = 0,
    this.paddingRight = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            title,
            style: titleStyle ?? context.textTheme.titleSmall,
          ),
          Text(
            value,
            style: valueStyle ?? context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
