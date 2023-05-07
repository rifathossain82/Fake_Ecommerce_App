import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KTextFormFiled extends StatelessWidget {
  const KTextFormFiled({
    Key? key,
    required this.controller,
    this.validator,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.maxLines,
    this.minLines,
    this.inputType,
    this.inputAction,
    this.suffix,
    this.prefixIcon,
    this.obscureValue,
    this.isBorder = true,
  }) : super(key: key);

  final TextEditingController controller;
  final FormFieldValidator? validator;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final Function(String value)? onChanged;
  final int? maxLines;
  final int? minLines;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Widget? suffix;
  final Widget? prefixIcon;
  final bool? obscureValue;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      onChanged: onChanged,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      keyboardType: inputType,
      textInputAction: inputAction,
      obscureText: obscureValue ?? false,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        labelStyle: GoogleFonts.roboto(
          textStyle: MyTextStyles.h4.copyWith(
            color: kGreyTextColor,
          ),
        ),
        border: isBorder
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kGreyTextColor,
                ),
              )
            : InputBorder.none,
        suffixIcon: suffix,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
