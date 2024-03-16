import 'package:cinemax/core/helpers/app_regex.dart';
import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/widgets/custom_text_form_field.dart';
import 'package:cinemax/features/auth/presentation/manager/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterViewTextFields extends StatelessWidget {
  const RegisterViewTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RegisterProvider>(context);
    return Column(
      children: [
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
      ],
    );
  }
}
