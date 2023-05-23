import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class OnBoardingSliderForwardButton extends StatelessWidget {
  final VoidCallback onTap;

  const OnBoardingSliderForwardButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.primaryColor.withOpacity(0.1),
        ),
        child: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 20,
          color: context.primaryColor,
        ),
      ),
    );
  }
}
