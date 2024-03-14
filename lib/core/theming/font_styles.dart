
import 'package:cinemax/core/theming/app_colors.dart';
import 'package:cinemax/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FontStyles {

  static TextStyle font18whiteMedium = TextStyle(
    color: Colors.white.withOpacity(0.20000000298023224),
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font25whiteMedium = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 25.sp
  );

  static TextStyle font18white70Medium = TextStyle(
    color: Colors.white70,
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
  );


  static TextStyle font16whiteMedium = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font24PrimaryBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.kPrimaryColor,
  );

  static TextStyle font14PrimaryBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.kPrimaryColor,
  );

  static TextStyle font22WhiteBold = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle font20WhiteBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static TextStyle font15WhiteMedium = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 15.sp,
  );

  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static TextStyle font14GraySemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white70,
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static TextStyle font18BlackMedium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.kBackGroundColor,
  );


}
