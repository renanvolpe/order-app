import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

abstract class Style {
  static TextStyle get textStyle {
    return GoogleFonts.plusJakartaSans();
  }

  static TextStyle defaultStyle = textStyle.copyWith(
    color: AppColor.kBlack,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle greyStyle = textStyle.copyWith(
    color: AppColor.kgrey2,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle primaryStyle = textStyle.copyWith(
    color: AppColor.kPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    decorationColor: AppColor.kPrimary,
  );

  static TextStyle darkStyle =
      textStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.kBlackText);

  static TextStyle whiteStyle = textStyle.copyWith(
    color: AppColor.kWhite,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
