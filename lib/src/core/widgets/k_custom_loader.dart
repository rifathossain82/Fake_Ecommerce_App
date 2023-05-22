import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/asset_path.dart';
import 'package:flutter/material.dart';

class KCustomLoader extends StatelessWidget {
  const KCustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AbsorbPointer(
        child: Center(
          child: SizedBox(
            width: 200.0,
            height: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: CircularProgressIndicator(
                        color: context.primaryColor,
                      ),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          AssetPath.logo,
                          color: context.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const DefaultTextStyle(
                  style: TextStyle(),
                  child: Text('Please Wait...'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
