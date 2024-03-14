import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MoviesDetailsFirstSecShimmer extends StatelessWidget {
  const MoviesDetailsFirstSecShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 200.h,
            color: Colors.white,
          ),
        ),
        verticalSpacer(25.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20.h,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              const Icon(Icons.bookmark_outline)
            ],
          ),
        ),
        verticalSpacer(5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 16.h,
                  width: 50.w,
                  color: Colors.white,
                ),
              ),
              verticalSpacer(10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18.w,
                  ),
                  verticalSpacer(5.h),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 16.h,
                      width: 40.w,
                      color: Colors.white,
                    ),
                  ),
                  horizontalSpacer(5.w),
                ],
              ),
              verticalSpacer(15.h),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 25.h,
                  color: Colors.white,
                ),
              ),
              verticalSpacer(20.h),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 20.h,
                  color: Colors.white,
                ),
              ),
              verticalSpacer(5.h),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 100.h,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
