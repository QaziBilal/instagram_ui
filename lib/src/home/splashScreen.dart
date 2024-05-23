import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_ui/src/auth/authentication.dart';
import 'package:job_ui/src/helper/colors.dart';
import 'package:job_ui/src/widget/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => AuthenticationScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolorwhite,
      body: Center(
        child: customImage(
            "assets/icons/drone.png",
            MediaQuery.sizeOf(context).width * 0.6,
            MediaQuery.sizeOf(context).width * 0.6,
            BoxFit.contain),
      ),
    );
  }
}
