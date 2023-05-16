import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/features/onboarding/data/model/onboarding_slider_model.dart';
import 'package:flutter/material.dart';

class OnBoardingSliderWidgetItemBuilder extends StatelessWidget {
  final OnBoardingSliderModel sliderModel;

  const OnBoardingSliderWidgetItemBuilder({
    Key? key,
    required this.sliderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              sliderModel.assetImgPath,
              width: context.screenWidth,
            ),
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sliderModel.title,
                maxLines: 1,
                style: context.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                sliderModel.subTitle,
                maxLines: 1,
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
