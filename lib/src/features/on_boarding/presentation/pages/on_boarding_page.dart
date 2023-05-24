import 'package:carousel_slider/carousel_controller.dart';
import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/routes/routes.dart';
import 'package:fake_ecommerce_app/src/core/services/local_storage.dart';
import 'package:fake_ecommerce_app/src/core/utils/app_constants.dart';
import 'package:fake_ecommerce_app/src/core/utils/asset_path.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/features/on_boarding/data/model/on_boarding_slider_model.dart';
import 'package:fake_ecommerce_app/src/features/on_boarding/presentation/cubits/on_boarding_cubit.dart';
import 'package:fake_ecommerce_app/src/features/on_boarding/presentation/cubits/on_boarding_state.dart';
import 'package:fake_ecommerce_app/src/features/on_boarding/presentation/widgets/on_boarding_slider_forward_button.dart';
import 'package:fake_ecommerce_app/src/features/on_boarding/presentation/widgets/on_boarding_slider_indicator_widget.dart';
import 'package:fake_ecommerce_app/src/features/on_boarding/presentation/widgets/on_boarding_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final CarouselController sliderController = CarouselController();

  final sliderDataList = [
    OnBoardingSliderModel(
      assetImgPath: AssetPath.introImage1,
      title: 'Welcome to ${AppConstants.appName}',
      subTitle: 'Your one-stop shop for all your fashion needs',
    ),
    OnBoardingSliderModel(
      assetImgPath: AssetPath.introImage2,
      title: 'Get ready to shop',
      subTitle: 'Discover the latest trends and shop with ease',
    ),
    OnBoardingSliderModel(
      assetImgPath: AssetPath.introImage3,
      title: 'Join our community',
      subTitle:
          'Get exclusive deals, fashion tips, and more by signing up today',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          OnBoardingCubit onBoardingCubit = context.read<OnBoardingCubit>();
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  /// slider
                  OnBoardingSliderWidgetBuilder(
                    controller: sliderController,
                    sliderDataList: sliderDataList,
                    sliderIndex: onBoardingCubit.sliderIndex,
                    onPageChanged: (index, reason) {
                      onBoardingCubit.updateSliderIndex(index);
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
                          currentSliderIndex: onBoardingCubit.sliderIndex,
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
                      final localStorage = sl<LocalStorage>();
                      localStorage.saveData(
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
                      style: context.buttonTextStyle,
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
