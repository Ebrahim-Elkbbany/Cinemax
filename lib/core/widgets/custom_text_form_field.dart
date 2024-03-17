import 'package:cinemax/core/theming/app_colors.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:cinemax/features/profile/presentation/manager/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final IconData? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Function()? suffixIconTap;
  final void Function(String)? onChange;

  const CustomTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.suffixIconTap, this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;

    return TextFormField(
       onChanged: onChange,
      cursorColor: AppColors.kPrimaryColor,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.kPrimaryColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide:  BorderSide(
                color: isDarkTheme ? AppColors.imageGreyColor :Colors.black.withOpacity(0.35) ,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: hintStyle ?? FontStyles.font18whiteMedium.copyWith(
          color: isDarkTheme ? null :Colors.black.withOpacity(0.20000000298023224),

        ),
        hintText: hintText,
        suffixIcon: GestureDetector(
          onTap: suffixIconTap,
          child: Icon(
            suffixIcon,
          ),
        ),
        fillColor: backgroundColor ?? (isDarkTheme
            ? AppColors.imageGreyColor
            : AppColors.kSecondaryColor),
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: FontStyles.font18white70Medium.copyWith(
        color: isDarkTheme ? Colors.white70 :Colors.black87,
        fontWeight: isDarkTheme ? null : FontWeight.w400
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
