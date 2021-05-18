import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles {
  static TextStyle titleText = GoogleFonts.aBeeZee(
    color: AppColors.mainColor,
    fontSize: 25,
    letterSpacing: 1.2,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textField = GoogleFonts.aBeeZee(
    color: AppColors.mainColor,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static TextStyle forgetPasswordText = GoogleFonts.aBeeZee(
    color: AppColors.whiteColor,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonText = GoogleFonts.aBeeZee(
    color: AppColors.whiteColor,
    fontSize: 18,
    letterSpacing: 1.2,
    fontWeight: FontWeight.bold,
  );
}
