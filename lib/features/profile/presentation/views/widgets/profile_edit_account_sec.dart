import 'package:cinemax/core/helpers/extensions.dart';
import 'package:cinemax/core/theming/app_colors.dart';
import 'package:cinemax/features/profile/presentation/manager/account_editing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/helpers/responsive_spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/font_styles.dart';
import '../../../../../core/theming/font_weight_helper.dart';

class ProfileEditAccountSec extends StatelessWidget {
  const ProfileEditAccountSec({super.key, required this.isDarkTheme});
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AccountEditingProvider>(
      create: (context) =>
      AccountEditingProvider()..getUserData(),
      child:  Consumer<AccountEditingProvider>(
        builder: (context, value, child) {
          value.getUserData();
          return Container(
            height: 86,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context
                          .read<AccountEditingProvider>()
                          .fNameController
                          .text,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: FontStyles.font16whiteMedium.copyWith(
                        color: isDarkTheme
                            ? null
                            : AppColors.kBackGroundColor,
                      ),
                    ),
                    verticalSpacer(3),
                    Text(
                      context
                          .read<AccountEditingProvider>()
                          .emailController
                          .text,
                      style: FontStyles.font14GrayRegular.copyWith(
                        fontWeight: FontWeightHelper.medium,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    context.pushNamed(Routes.accountEditingView);
                  },
                  child: Icon(
                    Icons.edit_rounded,
                    size: 20.w,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
