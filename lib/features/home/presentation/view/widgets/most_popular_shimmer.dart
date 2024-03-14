import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MostPopularShimmer extends StatelessWidget {
  const MostPopularShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.separated(
        separatorBuilder: (context, index) => horizontalSpacer(20),
        itemBuilder: (context, index) => SizedBox(
          width: 140.w,
          height: 150.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                height: 200.h,
                width: 150.w,
              ),
              verticalSpacer(12),
              Container(
                color: Colors.white,
                height: 18.h,
                width: double.infinity,
              ),
              verticalSpacer(5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    height: 18.h,
                    width: 18.w,
                  ),
                  horizontalSpacer(5),
                  Container(
                    color: Colors.white,
                    height: 18.h,
                    width: 50.w,
                  ),
                  horizontalSpacer(5),
                ],
              ),
            ],
          ),
        ),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
