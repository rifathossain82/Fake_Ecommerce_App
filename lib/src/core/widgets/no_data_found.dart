import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/asset_path.dart';
import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  final VoidCallback? searchAgain;
  final String? subTitle;

  const NoDataFound({
    Key? key,
    this.searchAgain,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetPath.people,
              width: context.screenHeight * 0.25,
              height: context.screenHeight * 0.25,
              fit: BoxFit.cover,
            ),
            Text(
              'No Data Found!',
              style: context.textTheme.headline6,
            ),
            const SizedBox(height: 5),
            Text(
              subTitle ?? '',
              textAlign: TextAlign.center,
              style: context.textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
