import 'package:carousel_slider/carousel_controller.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/routes/routes.dart';
import 'package:fake_ecommerce_app/src/core/services/local_storage.dart';
import 'package:fake_ecommerce_app/src/core/utils/asset_path.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/utils/styles.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/features/onboarding/data/model/onboarding_slider_model.dart';
import 'package:fake_ecommerce_app/src/features/onboarding/presentation/cubits/onboarding_cubit.dart';
import 'package:fake_ecommerce_app/src/features/onboarding/presentation/cubits/onboarding_state.dart';
import 'package:fake_ecommerce_app/src/features/onboarding/presentation/widgets/onboarding_slider_forward_button.dart';
import 'package:fake_ecommerce_app/src/features/onboarding/presentation/widgets/onboarding_slider_indicator_widget.dart';
import 'package:fake_ecommerce_app/src/features/onboarding/presentation/widgets/onboarding_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final CarouselController sliderController = CarouselController();
  late OnBoardingCubit onBoardingCubit;

  final sliderDataList = [
    OnBoardingSliderModel(
      assetImgPath: AssetPath.introImage1,
      title: 'Intro 1 Title',
      subTitle: 'Intro 1 Subtitle',
    ),
    OnBoardingSliderModel(
      assetImgPath: AssetPath.introImage2,
      title: 'Intro 2 Title',
      subTitle: 'Intro 2 Subtitle',
    ),
    OnBoardingSliderModel(
      assetImgPath: AssetPath.introImage3,
      title: 'Intro 3 Title',
      subTitle: 'Intro 3 Subtitle',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  /// slider
                  OnBoardingSliderWidgetBuilder(
                    controller: sliderController,
                    sliderDataList: sliderDataList,
                    sliderIndex: 0,
                    onPageChanged: (index, reason) {
                      // onBoardingController.updateSliderIndex(index);
                    },
                  ),

                  /// indicator
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OnBoardingSliderIndicatorWidget(
                          sliderLength: sliderDataList.length,
                          currentSliderIndex: 0,
                        ),
                        OnBoardingSliderForwardButton(
                          onTap: () {
                            sliderController.nextPage();
                          },
                        ),
                      ],
                    ),
                  ),

                  /// spacer to divide slider
                  const Spacer(),

                  /// get started button
                  KButton(
                    onPressed: () {
                      LocalStorage.saveData(
                        key: LocalStorageKey.onBoarding,
                        data: true,
                      ).then(
                        (value) => context.pushNamedAndRemoveUntil(
                          RouteGenerator.login,
                        ),
                      );
                    },
                    width: context.screenWidth - 30,
                    child: Text(
                      'GET STARTED',
                      style: MyTextStyles.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kWhite,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        });
  }
}
