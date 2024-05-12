import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';

class AppTextstyles {
  static TextStyle textFamilyMadaniSize16Weight400 = TextStyle(
    fontFamily: 'Madani',
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: Colors.black,
  );
  static TextStyle textFamilyMadaniSize12Weight400 = TextStyle(
    fontFamily: 'Madani',
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static TextStyle textFamilyMadaniSize18Weight100Colorblue50 = TextStyle(
      fontFamily: 'Madani',
      fontWeight: FontWeight.w100,
      fontSize: 22.sp,
      color: Colors.blueGrey[200]);
  static TextStyle textFamilyMadaniSize14Weight400 = TextStyle(
    fontFamily: 'Madani',
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.borderColor,
  );
  static TextStyle textFamilyMadaniSize14Weight400WhiteColor = TextStyle(
    fontFamily: 'Madani',
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: Colors.white,
  );
  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.greyLight,
  );
  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.mainColor,
  );
  static TextStyle textFamilyMadaniSize28Weight900WhiteColorGreen = TextStyle(
    fontFamily: 'Madani',
    fontSize: 24.sp,
    fontWeight: FontWeight.w900,
    color: AppColors.mainColor,
  );

  static TextStyle textFamilyInterSize12Weight600BlackColor = TextStyle(
    fontFamily: 'inter',
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle textFamilyInterSize18Weight600BlackColor = TextStyle(
    fontFamily: 'inter',
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}
