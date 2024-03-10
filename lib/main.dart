import 'package:cinemax/core/helpers/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helpers/service_locator.dart';

void main() async {
  await CacheHelper.init();
  setupServiceLocator();
  await ScreenUtil.ensureScreenSize();
  runApp(const CineMaxApp());
}

class CineMaxApp extends StatelessWidget {
  const CineMaxApp({super.key});



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder:(context, child) =>  const MaterialApp(

      ),
    );
  }
}
