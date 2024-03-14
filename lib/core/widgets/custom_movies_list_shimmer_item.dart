import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomMoviesListShimmer extends StatelessWidget {
  const CustomMoviesListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 20),
      separatorBuilder: (context, index) => verticalSpacer(10),
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150.w,
              height: 200.h,
              color: Colors.white,
            ),
            horizontalSpacer(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 20.h,
                  color: Colors.white,
                ),
                verticalSpacer(5),
                Container(
                  width: 50.w,
                  height: 12.h,
                  color: Colors.white,
                ),
                verticalSpacer(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 18.w,
                      height: 18.h,
                      color: Colors.white,
                    ),
                    horizontalSpacer(5),
                    Container(
                      width: 40.w,
                      height: 12.h,
                      color: Colors.white,
                    ),
                    horizontalSpacer(5),
                  ],
                ),
                verticalSpacer(10),
                SizedBox(
                  height: 25.h,
                  width: MediaQuery.of(context).size.width / 2,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      width: 80.w,
                      height: 25.h,
                      margin: EdgeInsets.only(right: 5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                      ),
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
