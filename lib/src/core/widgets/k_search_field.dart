import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KSearchField extends StatelessWidget {
  const KSearchField({
    Key? key,
    required this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.onSubmitted,
    this.onChanged,
    this.inputType,
    this.inputAction,
    this.suffix,
    this.obscureValue,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final Function(String value)? onSubmitted;
  final Function(String value)? onChanged;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Widget? suffix;
  final bool? obscureValue;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      maxLines: 1,
      keyboardType: inputType,
      textInputAction: inputAction,
      obscureText: obscureValue ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: MyTextStyles.h4.copyWith(
          color: kGreyTextColor,
        ),
        labelText: labelText,
        filled: true,
        fillColor: kGreyMedium.withOpacity(0.1),
        contentPadding: EdgeInsets.zero,
        prefixIcon: Icon(
          Icons.search,
          size: 20,
          color: kGrey,
        ),
        labelStyle: GoogleFonts.roboto(
          textStyle: MyTextStyles.h4.copyWith(
            color: kGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent)
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
