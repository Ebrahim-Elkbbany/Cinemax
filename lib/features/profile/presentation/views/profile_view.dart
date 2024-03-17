import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cinemax/core/helpers/cache_helper.dart';
import 'package:cinemax/core/helpers/extensions.dart';
import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/routing/routes.dart';
import 'package:cinemax/core/widgets/custom_button.dart';
import 'package:cinemax/features/profile/presentation/manager/app_theme_provider.dart';
import 'package:cinemax/features/profile/presentation/views/widgets/profile_edit_account_sec.dart';
import 'package:cinemax/features/profile/presentation/views/widgets/profile_second_container_sec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            children: [
              ProfileEditAccountSec(isDarkTheme: isDarkTheme),
              verticalSpacer(30),
              const ProfileSecondContainerSec(),
              verticalSpacer(30),
              CustomButton(
                buttonName: "Log out",
                onPressed: () {
                  logoutDialog(context);
                },
              ),
              verticalSpacer(40),
            ],
          ),
        ));
  }

  void logoutDialog(BuildContext context){
    AwesomeDialog(
      context: context,
      title: 'Are you sure you want to logout ?',
      desc:"If you logged out you would need to re-enter the Email and password if you want to enter again. ",
      animType: AnimType.bottomSlide,
      btnCancelOnPress: () {},
      dialogType: DialogType.question,
      btnOkText: 'Yes',
      btnCancelText:'No' ,
      btnOkOnPress: () {
        CacheHelper.removeData(key: 'token');
        context.pushNamedAndRemoveUntil(Routes.loginView,
            predicate: (route) => false);
      },

    ).show();
  }
}
