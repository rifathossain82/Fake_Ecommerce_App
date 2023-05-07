import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'color.dart';
import 'dimensions.dart';

class MyTextStyles {

  static TextStyle get h1 {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.fontSizeOverLarge,
      color: kBlackLight,
    );
  }

  static TextStyle get h2 {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.fontSizeExtraLarge,
      color: kBlackLight,
    );
  }

  static TextStyle get h3 {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.fontSizeLarge,
      color: kBlackLight,
    );
  }

  static TextStyle get h4 {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.fontSizeDefault,
      color: kBlackLight,
    );
  }

  static TextStyle get h5 {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.fontSizeSmall,
      color: kBlackLight,
    );
  }

  static TextStyle get h6 {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.fontSizeExtraSmall,
      color: kBlackLight,
    );
  }
}
