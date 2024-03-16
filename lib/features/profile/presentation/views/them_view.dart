import 'package:cinemax/features/profile/presentation/manager/app_theme_provider.dart';
import 'package:cinemax/features/profile/presentation/views/widgets/custom_radio_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Column(
            children: [
              CustomRadioContainer(
                name: "",
                leading: "Dark",
                isSelected: theme.isDarkTheme,
                onPressed: () {
                  theme.changeTheme();
                },
              ),
              CustomRadioContainer(
                name: "",
                leading: "Light",
                isSelected: !theme.isDarkTheme,
                onPressed: () {
                  theme.changeTheme();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
