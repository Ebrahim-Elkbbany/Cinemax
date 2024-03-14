import 'package:cinemax/core/helpers/app_regex.dart';
import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/theming/app_colors.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:cinemax/features/onboarding/presenattion/manager/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cinemax/core/widgets/custom_button.dart';
import 'package:cinemax/core/widgets/custom_text_form_field.dart';
import 'package:cinemax/features/auth/presentation/manager/register_provider.dart';
import 'package:cinemax/features/auth/presentation/view/widgets/have_account_sec.dart';
import 'package:cinemax/features/auth/presentation/view/widgets/term_conditions_sec.dart';
import 'package:provider/provider.dart';

class ResisterView extends StatelessWidget {
  const ResisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RegisterProvider>(context);
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    return ModalProgressHUD(
      inAsyncCall: provider.isLoading,
      color: AppColors.kPrimaryColor,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 33.h),
            child: Form(
              key: provider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacer(10),
                  Text(
                    'Create Account',
                    style: FontStyles.font24PrimaryBold,
                  ),
                  verticalSpacer(10),
                  Text(
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                    style: FontStyles.font14GrayRegular.copyWith(
                      color: isDarkTheme
                          ? Colors.white70
                          : AppColors.kBackGroundColor,
                    ),
                  ),
                  verticalSpacer(36),
                  AppTextFormField(
                    controller: provider.fNameController,
                    hintText: 'First Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    },
                  ),
                  verticalSpacer(20),
                  AppTextFormField(
                    controller: provider.sNameController,
                    hintText: 'Last Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    },
                  ),
                  verticalSpacer(20),
                  AppTextFormField(
                    controller: provider.emailController,
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isEmailValid(value)) {
                        return 'Please enter a valid email';
                      }
                    },
                  ),
                  verticalSpacer(20),
                  AppTextFormField(
                    controller: provider.passController,
                    hintText: 'Password',
                    suffixIcon: provider.isPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    isObscureText: provider.isPassword,
                    suffixIconTap: provider.isPasswordChange,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    },
                  ),
                  verticalSpacer(20),
                  AppTextFormField(
                    controller: provider.confirmPassController,
                    hintText: 'Confirm Password',
                    isObscureText: provider.isPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      } else if (value != provider.passController.text) {
                        return 'Passwords are not same';
                      }
                    },
                  ),
                  verticalSpacer(35),
                  CustomButton(
                    buttonName: 'Register',
                    onPressed: () async {
                      if (provider.formKey.currentState!.validate()) {
                        await provider.register(context);
                      }
                    },
                  ),
                  verticalSpacer(20),
                  const TermConditionsSec(),
                  verticalSpacer(30),
                  const HaveAccountSec(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
