import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/routes/routes.dart';
import 'package:flutter/material.dart';

class CreateANewAccountTextButton extends StatelessWidget {
  const CreateANewAccountTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushReplacementNamed(routeName: RouteGenerator.register);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Don't have an Account?",
              style: context.textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Create a new Account",
                  style: context.textTheme.bodyLarge,
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.arrow_forward,
                  size: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
