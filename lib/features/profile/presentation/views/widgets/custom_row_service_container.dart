import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/theming/app_colors.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:cinemax/features/profile/presentation/manager/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomRowServiceContainer extends StatelessWidget {
  const CustomRowServiceContainer({
    super.key,
    required this.onPressed,
    required this.name,
    required this.iconName,
    this.isLast = false,
  });

  final void Function() onPressed;
  final String name;
  final IconData iconName;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconName,
              color: Colors.grey,
              size: 26.w,
            ),
            horizontalSpacer(24),
            Text(
              name,
              style: FontStyles.font16whiteMedium.copyWith(
                fontWeight: FontWeight.w400,
                color: isDarkTheme ? null : AppColors.kBackGroundColor,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onPressed,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20.w,
                color: AppColors.kPrimaryColor,
              ),
            )
          ],
        ),
        if(!isLast)
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Divider(
            height: 1.h,
            color: Colors.grey,
            thickness: 1.w,
          ),
        ),
      ],
    );
  }
}
