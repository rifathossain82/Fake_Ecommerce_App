import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:flutter/material.dart';

class OnBoardingSliderIndicatorWidget extends StatelessWidget {
  final int sliderLength;
  final int currentSliderIndex;

  const OnBoardingSliderIndicatorWidget({
    Key? key,
    required this.sliderLength,
    required this.currentSliderIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: sliderLength,
      itemBuilder: (context, int index) {
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 5.0,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentSliderIndex == index
                ? kPrimaryColor
                : kPrimaryColor.withOpacity(0.1),
          ),
        );
      },
    );
  }
}
