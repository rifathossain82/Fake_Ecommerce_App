import 'package:carousel_slider/carousel_slider.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/features/on_boarding/data/model/on_boarding_slider_model.dart';
import 'package:fake_ecommerce_app/src/features/on_boarding/presentation/widgets/on_boarding_slider_widget_item_builder.dart';
import 'package:flutter/material.dart';

class OnBoardingSliderWidgetBuilder extends StatelessWidget {
  final CarouselController? controller;
  final List<OnBoardingSliderModel> sliderDataList;
  final int sliderIndex;
  final Function(int index, CarouselPageChangedReason reason) onPageChanged;

  const OnBoardingSliderWidgetBuilder({
    Key? key,
    this.controller,
    required this.sliderDataList,
    required this.sliderIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: controller,
      options: CarouselOptions(
        height: context.screenHeight * 0.6,
        viewportFraction: 1,
        initialPage: 0,
        enlargeFactor: 0.2,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(
          milliseconds: 1000,
        ),
        autoPlayCurve: Curves.easeInCubic,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: onPageChanged,
      ),
      items: sliderDataList.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return OnBoardingSliderWidgetItemBuilder(
              sliderModel: sliderDataList[sliderIndex],
            );
          },
        );
      }).toList(),
    );
  }
}
