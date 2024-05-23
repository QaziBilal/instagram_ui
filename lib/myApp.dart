import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_ui/src/auth/authentication.dart';
import 'package:job_ui/src/helper/colors.dart';
import 'package:job_ui/src/home/home.dart';
import 'package:job_ui/src/home/splashScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: kcolorwhite),
                useMaterial3: true,
              ),
              home: SplashScreen(),
            ));
  }
}
