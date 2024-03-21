import 'package:cinemax/core/helpers/app_regex.dart';
import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/widgets/custom_text_filed_name.dart';
import 'package:cinemax/core/widgets/custom_text_form_field.dart';
import 'package:cinemax/features/profile/presentation/manager/account_editing_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountViewTextFieldsSec extends StatelessWidget {
  const AccountViewTextFieldsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AccountEditingProvider>().accountFormKey,
      child: Column(
        children: [
          const CustomTextFieldName(name: 'First Name'),
          CustomTextFormField(
            controller:
            context.read<AccountEditingProvider>().fNameController,
            hintText: 'First Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
            },
          ),
          verticalSpacer(5),
          const CustomTextFieldName(name: 'LastName'),
          CustomTextFormField(
            controller:
            context.read<AccountEditingProvider>().sNameController,
            hintText: 'Last Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
            },
          ),
          verticalSpacer(5),
          const CustomTextFieldName(name: 'Email'),
          CustomTextFormField(
            controller:
            context.read<AccountEditingProvider>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),

        ],
      ),
    );
  }
}
