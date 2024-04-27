import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';

class AppStyles {
  AppStyles._();

  static TextStyle s40w500 = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'MPlusRegular',
    color: AppColors.buttonColor,
    fontSize: 40,
  );

  static TextStyle s20w400 = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'MPlusRegular',
    color: AppColors.buttonColor,
    fontSize: 20,
  );

  static TextStyle s16w500 = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'MPlusRegular',
    color: AppColors.hintColor,
    fontSize: 16,
  );
}
