import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  const ForgotPasswordTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => ForgotPasswordScreen());
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(
            'Forgot Password?',
            style: context.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
