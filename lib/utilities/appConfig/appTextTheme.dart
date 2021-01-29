import 'package:common_infra_ads/utilities/appConfig/responsive.dart';
import 'package:flutter/material.dart';

import 'appColors.dart';

class AppTextTheme {
  final AppColors colors;
  final Responsive responsive;

  AppTextTheme(this.responsive, this.colors);

  TextStyle get textStyle1 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(13),
        fontWeight: FontWeight.w400,
      );

  TextStyle get textStyle2 => TextStyle(
        color: colors.white,
        fontSize: responsive.height(20),
        fontWeight: FontWeight.w600,
      );

  TextStyle get textStyle3 => TextStyle(
        color: colors.blue,
        fontSize: responsive.height(26),
        fontWeight: FontWeight.w700,
      );

  TextStyle get textStyle4 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(16),
        fontWeight: FontWeight.w400,
      );

  // Sign-Up / Login / Forgot Password Screens

  TextStyle get textStyle5 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(26),
        fontWeight: FontWeight.w700,
      );

  TextStyle get textStyle6 => TextStyle(
        color: colors.blue,
        fontSize: responsive.height(14),
        fontWeight: FontWeight.w400,
      );

  TextStyle get textStyle7 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(12),
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle8 => TextStyle(
        color: Colors.grey[400],
        fontSize: responsive.height(14),
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle9 => TextStyle(
        color: Colors.grey[500],
        fontSize: responsive.height(12),
        fontWeight: FontWeight.w400,
      );

  TextStyle get textStyle10 => TextStyle(
        color: colors.blue,
        fontSize: responsive.height(12),
        fontWeight: FontWeight.w400,
      );

  // Help Us Know You Better Screen
  TextStyle get textStyle11 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(18),
        fontWeight: FontWeight.w400,
      );

  TextStyle get textStyle12 => TextStyle(
        color: colors.blue,
        fontSize: responsive.height(13),
        fontWeight: FontWeight.w400,
      );

  //Get To Know Yourself Screen
  TextStyle get textStyle13 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(21),
        fontWeight: FontWeight.w600,
      );

  TextStyle get textStyle14 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(34),
        fontWeight: FontWeight.w600,
      );

  TextStyle get textStyle15 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(25),
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle16 => TextStyle(
        color: colors.blue,
        fontSize: responsive.height(51),
        fontWeight: FontWeight.w700,
      );

  TextStyle get textStyle17 => TextStyle(
        color: Colors.grey[600],
        fontSize: responsive.height(15),
        fontWeight: FontWeight.w300,
      );

  // Whats Your Goal
  TextStyle get textStyle18 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(26),
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle19 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(55),
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle20 => TextStyle(
        color: Colors.grey[500],
        fontSize: responsive.height(23),
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle21 => TextStyle(
        color: colors.white,
        fontSize: responsive.height(23),
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle22 => TextStyle(
        color: Colors.grey[500],
        fontSize: responsive.height(12.5),
        fontWeight: FontWeight.w300,
      );

  TextStyle get textStyle23 => TextStyle(
        color: colors.white,
        fontSize: responsive.height(12.5),
        fontWeight: FontWeight.w300,
      );

  // Your Calorie Goal
  TextStyle get textStyle24 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(16),
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle25 => TextStyle(
        color: colors.blue,
        fontSize: responsive.height(24),
        fontWeight: FontWeight.w700,
      );

  // Set Your Target weight

  TextStyle get textStyle26 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(21),
        fontWeight: FontWeight.w500,
      );

  // Bottom Navigation Bar

  TextStyle get textStyle27 => TextStyle(
        color: colors.blue,
        fontSize: responsive.height(15),
        fontWeight: FontWeight.w500,
      );

  // Profile Tab

  TextStyle get textStyle28 => TextStyle(
        color: colors.blue,
        fontSize: responsive.height(14),
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle29 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(22),
        fontWeight: FontWeight.w600,
      );

  TextStyle get textStyle30 => TextStyle(
        color: colors.black.withOpacity(0.5),
        fontSize: responsive.height(13),
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle31 => TextStyle(
        color: colors.blue,
        fontSize: responsive.height(18),
        fontWeight: FontWeight.w600,
      );

  TextStyle get textStyle32 => TextStyle(
        color: colors.black.withOpacity(0.5),
        fontSize: responsive.height(15),
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle33 => TextStyle(
        color: colors.blue,
        fontSize: responsive.height(11),
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle34 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(24),
        fontWeight: FontWeight.w600,
      );

  TextStyle get textStyle35 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(16),
        fontWeight: FontWeight.w400,
      );

  TextStyle get textStyle36 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(18),
        fontWeight: FontWeight.w600,
      );

  TextStyle get textStyle37 => TextStyle(
        color: colors.black,
        fontSize: responsive.height(15),
        fontWeight: FontWeight.w400,
      );

  TextStyle get textStyle38 => TextStyle(
        color: colors.blue,
        fontSize: responsive.height(30),
        fontWeight: FontWeight.w700,
      );

  TextStyle get textStyle39 => TextStyle(
        color: colors.blue,
        fontSize: responsive.height(13),
        fontWeight: FontWeight.w400,
      );
}
