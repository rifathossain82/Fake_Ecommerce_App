import 'package:fake_ecommerce_app/src/core/utils/asset_path.dart';
import 'package:flutter/material.dart';

class KLogo extends StatelessWidget {
  final double? height;
  final double? width;
  const KLogo({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'KLogo',
      child: Image.asset(
        AssetPath.logo,
        height: height ?? 120,
        width: width ?? 200,
      ),
    );
  }
}
