import 'package:fake_ecommerce_app/src/core/widgets/k_shimmer_container.dart';
import 'package:flutter/material.dart';

class ShimmerGridViewBuilder extends StatelessWidget {
  final int itemCount;
  final double childAspectRatio;
  final double borderRadius;

  const ShimmerGridViewBuilder({
    Key? key,
    this.itemCount = 10,
    this.childAspectRatio = 4 / 7,
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
        bottom: 80,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) => KShimmerContainer(
        borderRadius: borderRadius,
      ),
    );
  }
}
