import 'package:cinemax/core/theming/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:cinemax/features/onboarding/presenattion/manager/app_theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theming/app_colors.dart';



class TermConditionsSec extends StatelessWidget {
  const TermConditionsSec({super.key});


  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: FontStyles.font13GrayRegular.copyWith(
              color: isDarkTheme ? Colors.grey :AppColors.kBackGroundColor,

            ),
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: FontStyles.font14GraySemiBold.copyWith(
              color: isDarkTheme ? Colors.white70 :AppColors.kBackGroundColor,
            ),
          ),
          TextSpan(
            text: ' and',
            style: FontStyles.font13GrayRegular.copyWith(
                color: isDarkTheme ? Colors.grey :AppColors.kBackGroundColor,
                height: 1.5),
          ),
          TextSpan(
            text: ' PrivacyPolicy.',
            style: FontStyles.font14GraySemiBold.copyWith(
              color: isDarkTheme ? Colors.white70 :AppColors.kBackGroundColor,

            ),
          ),
        ],
      ),
    );
  }
}
