import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_ui/src/helper/colors.dart';
import 'package:job_ui/src/helper/icons.dart';
import 'package:job_ui/src/helper/text_style.dart';
import 'package:job_ui/src/home/homeScreen.dart';
import 'package:job_ui/src/widget/custom_image.dart';
import 'package:job_ui/src/widget/custom_sizedboxes.dart';
import 'package:job_ui/src/widget/custom_text.dart';

import '../home/home.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 50), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomwPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: kcolorwhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
          child: Column(
            children: [
              customText(
                  "Input the four Digit code sent to your e-mail address",
                  size: 18,
                  align: true),
              kSizedboxheight(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textbox(context, sw),
                  textbox(context, sw),
                  textbox(context, sw),
                  textbox(context, sw),
                ],
              ),
              kSizedboxheight(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customText("Didn't Recieve any code?", size: 14),
                  Row(
                    children: [
                      customImage(kIconResend, 25, 25, BoxFit.contain),
                      customText("Resend", size: 14)
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textbox(context, sw) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: kcolorblack),
          borderRadius: BorderRadius.circular(6)),
      width: sw * 0.1,
      height: sw * 0.1,
      child: Center(
        child: TextFormField(
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          decoration: InputDecoration(
              isDense: true,
              hintText: "0",
              hintStyle: ktextstyleBlack.copyWith(fontSize: 15),
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none),
          style: ktextstyleBlack.copyWith(fontSize: 15),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ),
    );
  }
}
