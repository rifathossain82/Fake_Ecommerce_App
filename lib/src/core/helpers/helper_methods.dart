import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/utils/styles.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_outlined_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void kSnackBar({required String message, required Color bgColor}) {
  // if (!Get.isSnackbarOpen) {
  //   Get.showSnackbar(
  //     GetSnackBar(
  //       backgroundColor: bgColor,
  //       message: message,
  //       maxWidth: 1170,
  //       duration: const Duration(seconds: 3),
  //       snackStyle: SnackStyle.FLOATING,
  //       margin: const EdgeInsets.all(10),
  //       borderRadius: 5,
  //       isDismissible: true,
  //       dismissDirection: DismissDirection.horizontal,
  //     ),
  //   );
  // }
}

/// to check internet connection, it return bool type value
Future<bool> get hasInternet async {
  var result = await (Connectivity().checkConnectivity());
  if (result == ConnectivityResult.none) {
    return false;
  } else {
    return true;
  }
}

/// to send request in server with async system we use the run method of DeBouncer class
class DeBouncer {
  int? milliseconds;
  VoidCallback? action;
  static Timer? timer;

  static run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

/// to print in console when app is only debug mode
void kPrint(dynamic data) {
  if (kDebugMode) {
    print(data);
  }
}

Future<bool?> kConfirmDialog({
  required BuildContext context,
  required String title,
  required String negativeActionText,
  required String positiveActionText,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          icon: Icon(
            Icons.question_mark,
            color: kPrimaryColor,
          ),
          title: Text(
            title,
            style: MyTextStyles.h2.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                negativeActionText,
                style: MyTextStyles.h4.copyWith(
                  color: kGrey,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                positiveActionText,
                style: MyTextStyles.h4.copyWith(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        );
      });
}

Future<bool?> customDeleteDialog({
  required BuildContext context,
  required String title,
  required AlignmentGeometry dialogPosition,
  required String contentText,
  required String negativeActionText,
  required String positiveActionText,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              contentText,
              style: MyTextStyles.h4,
            ),
          ),
          insetPadding: const EdgeInsets.all(15),
          alignment: dialogPosition,
          title: Text(
            title,
            textAlign: TextAlign.start,
            style: MyTextStyles.h2.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            KOutlinedButton(
              onPressed: () => Navigator.pop(context, true),
              width: context.screenWidth * 0.4,
              child: Text(
                positiveActionText,
                style: MyTextStyles.h4.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            KButton(
              onPressed: () => Navigator.pop(context, false),
              width: context.screenWidth * 0.4,
              child: Text(
                negativeActionText,
                style: MyTextStyles.h4.copyWith(
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      });
}

Future<bool?> customDialog({
  required BuildContext context,
  required String title,
  required AlignmentGeometry dialogPosition,
  List<Widget>? actions,
  Widget? content,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: content,
          ),
          insetPadding: const EdgeInsets.all(15),
          alignment: dialogPosition,
          title: Text(
            title,
            textAlign: TextAlign.start,
            style: MyTextStyles.h2.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: actions,
        );
      });
}

Future customBottomSheet({
  required BuildContext context,
  double horizontalMargin = 0,
  required Widget content,
}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    constraints: BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width - horizontalMargin,
    ),
    builder: (context) {
      return content;
    },
  );
}
