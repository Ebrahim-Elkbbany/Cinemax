import 'package:cinemax/core/helpers/extensions.dart';
import 'package:cinemax/core/routing/routes.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:cinemax/features/onboarding/presenattion/manager/app_theme_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theming/app_colors.dart';



class HaveAccountSec extends StatelessWidget {
  const HaveAccountSec({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Have an account?',
            style: FontStyles.font13GrayRegular.copyWith(
              color: isDarkTheme ? Colors.grey :AppColors.kBackGroundColor,
            ),
          ),
          TextSpan(
            text: ' Login',
            style: FontStyles.font14GraySemiBold.copyWith(
              color: isDarkTheme ? Colors.white70 :AppColors.kBackGroundColor,

            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.pushReplacementNamed(Routes.loginView),
          )
        ]),
      ),
    );
  }
}
