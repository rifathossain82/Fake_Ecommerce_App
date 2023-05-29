import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class KShimmerContainer extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final BoxShape shape;

  const KShimmerContainer({
    Key? key,
    this.height = 100,
    this.width = double.infinity,
    this.borderRadius = 0,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.isDark ? kDarkPrimaryColor : kShimmerBaseColor,
      highlightColor: context.isDark ? kDarkScaffoldBgColor : kShimmerHighlightColor,
      period: const Duration(seconds: 1),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: kWhite,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle
              ? BorderRadius.circular(borderRadius)
              : null,
        ),
      ),
    );
  }
}
