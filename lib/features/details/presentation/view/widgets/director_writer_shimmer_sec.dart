import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/theming/app_colors.dart';

class DirectorWriterShimmerSec extends StatelessWidget {
  const DirectorWriterShimmerSec({super.key, required this.isDarkTheme});
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Director',
            style: FontStyles.font20WhiteBold.copyWith(
              fontWeight: FontWeight.w600,
              color: isDarkTheme ? null : AppColors.kBackGroundColor,
            ),
          ),
          verticalSpacer(5),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              children: List.generate(
                3, // Adjust the number of shimmer items as needed
                    (index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  height: 20.h,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          verticalSpacer(15),
          Text(
            'Writers',
            style: FontStyles.font20WhiteBold.copyWith(
              fontWeight: FontWeight.w600,
              color: isDarkTheme ? null : AppColors.kBackGroundColor,
            ),
          ),
          verticalSpacer(5),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              children: List.generate(
                3, // Adjust the number of shimmer items as needed
                    (index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  height: 20.h,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
