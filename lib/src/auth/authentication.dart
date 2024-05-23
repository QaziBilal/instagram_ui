import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_ui/src/auth/verification.dart';
import 'package:job_ui/src/helper/icons.dart';
import 'package:job_ui/src/widget/custom_image.dart';

import '../helper/colors.dart';
import '../helper/text_style.dart';
import '../widget/customButton.dart';
import '../widget/custom_sizedboxes.dart';
import '../widget/custom_text.dart';
import '../widget/custom_textfield.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController signupemailController = TextEditingController();
  TextEditingController signuppasswordController = TextEditingController();

  bool showLogin = true;
  int count = 1;
  bool isChecked = false;

  void togggleView() {
    setState(() {
      showLogin = !showLogin;
      count = showLogin ? 1 : 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kcolorwhite,
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              customImage(kIconDrone, MediaQuery.sizeOf(context).width * 0.4,
                  MediaQuery.sizeOf(context).width * 0.4, BoxFit.contain),
              kSizedboxheight(height: 40),
              AnimatedSwitcher(
                duration: Duration(seconds: 2),
                child: showLogin ? login() : signup(),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                key: ValueKey(count),
              ),
              kSizedboxheight(height: 100)
            ]),
          ),
        ));
  }

  Widget login() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Email",
              style: ktextstyleBlack.copyWith(
                fontSize: 14.sp,
              ),
            ),
          ),
          kSizedboxheight(height: 5),
          CustomTextFeild(
            controller: emailController,
            labelText: "Email",
          ),
          kSizedboxheight(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: ktextstyleBlack,
            ),
          ),
          kSizedboxheight(height: 5),
          CustomTextFeild(
            controller: passwordController,
            labelText: "***********",
            obscureText: true,
            suffixIcon: kIconEye,
          ),
          kSizedboxheight(height: 10),
          Row(
            children: [
              Checkbox(
                checkColor: kcolorwhite,
                activeColor: kcolorblack,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              customText("Remember me", size: 14),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Text(
                  "Forgot Password?",
                  style: ktextstyleWhite.copyWith(
                      color: kcolorgreylight,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          kSizedboxheight(height: 10),
          Custombutton(ontap: () {}, text: "Log-In"),
          kSizedboxheight(height: 50),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Not registered yet? ",
                  style: ktextstyleBlack.copyWith(
                      fontSize: 14.sp, color: kcolorgreylight)),
              TextSpan(
                  text: "Sign Up",
                  style: ktextstyleBlack.copyWith(
                      fontSize: 14.sp,
                      color: kcolorblack,
                      fontWeight: FontWeight.w700),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      togggleView();
                    })
            ]),
          ),
        ],
      ),
    );
  }

  Widget signup() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Email",
              style: ktextstyleBlack,
            ),
          ),
          kSizedboxheight(height: 5),
          CustomTextFeild(
            controller: emailController,
            labelText: "Email",
          ),
          kSizedboxheight(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: ktextstyleBlack,
            ),
          ),
          kSizedboxheight(height: 5),
          CustomTextFeild(
            controller: passwordController,
            labelText: "***********",
            obscureText: true,
            suffixIcon: kIconEye,
          ),
          kSizedboxheight(height: 20),
          Row(
            children: [
              Checkbox(
                checkColor: kcolorwhite,
                activeColor: kcolorblack,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Expanded(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(
                    text: "By Signing up you accept the ",
                    style: ktextstyleBlack.copyWith(
                        fontSize: 12.sp, color: kcolorgreylight)),
                TextSpan(
                    text: "Terms of Services",
                    style: ktextstyleBlack.copyWith(
                        fontSize: 12.sp,
                        color: kcolorblack,
                        fontWeight: FontWeight.w700)),
                TextSpan(
                    text: " and ",
                    style: ktextstyleBlack.copyWith(
                        fontSize: 12.sp, color: kcolorgreylight)),
                TextSpan(
                    text: "Privacy Policy",
                    style: ktextstyleBlack.copyWith(
                        fontSize: 12.sp,
                        color: kcolorblack,
                        fontWeight: FontWeight.w700))
              ]))),
            ],
          ),
          kSizedboxheight(height: 10),
          Custombutton(
            ontap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OTPScreen()));
            },
            text: "Sign Up",
          ),
          kSizedboxheight(height: 50),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Already have an Account? ",
                  style: ktextstyleBlack.copyWith(
                      fontSize: 14.sp, color: kcolorgreylight)),
              TextSpan(
                  text: "Log-In",
                  style: ktextstyleBlack.copyWith(
                      fontSize: 14.sp,
                      color: kcolorblack,
                      fontWeight: FontWeight.w700),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      togggleView();
                    })
            ]),
          ),
        ],
      ),
    );
  }
}
