import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/widgets/custom_button.dart';
import 'package:cinemax/features/profile/presentation/manager/account_editing_provider.dart';
import 'package:cinemax/features/profile/presentation/views/widgets/account_view_text_fields_sec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AccountEditingView extends StatelessWidget {
  const AccountEditingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My account"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Form(
            key: context.read<AccountEditingProvider>().formKey,
            child: Column(
              children: [
                verticalSpacer(40),
                const AccountViewTextFieldsSec(),
                verticalSpacer(30),
                Consumer<AccountEditingProvider>(
                  builder: (context, value, child) {
                    return CustomButton(
                      buttonName: "Save changes",
                      onPressed: () {
                        context
                            .read<AccountEditingProvider>()
                            .updateUserData(context);
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
