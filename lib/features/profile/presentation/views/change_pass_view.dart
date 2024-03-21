import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/widgets/custom_button.dart';
import 'package:cinemax/core/widgets/custom_text_filed_name.dart';
import 'package:cinemax/core/widgets/custom_text_form_field.dart';
import 'package:cinemax/features/profile/presentation/manager/account_editing_provider.dart';
import 'package:cinemax/features/profile/presentation/views/widgets/account_view_text_fields_sec.dart';
import 'package:cinemax/features/profile/presentation/views/widgets/change_password_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Column(
            children: [
              const ChangePasswordTextFields(),
              verticalSpacer(30),
              Consumer<AccountEditingProvider>(
                builder: (context, value, child) {
                  return CustomButton(
                    buttonName: "Save changes",
                    onPressed: () {
                      if (context
                          .read<AccountEditingProvider>()
                          .passFormKey
                          .currentState!
                          .validate()) {
                        context
                            .read<AccountEditingProvider>()
                            .updatePasswordData(context);
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
