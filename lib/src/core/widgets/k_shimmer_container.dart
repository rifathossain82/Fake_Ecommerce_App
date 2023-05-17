import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/box_shadow.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_logo.dart';
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
      baseColor: kShimmerBaseColor,
      highlightColor: kShimmerHighlightColor,
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
        child: const KLogo(
          height: 50,
        ),
      ),
    );
  }
}
