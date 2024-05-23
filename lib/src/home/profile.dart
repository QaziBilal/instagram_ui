import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'package:job_ui/src/helper/colors.dart';
import 'package:job_ui/src/home/profiel_details.dart';
import 'package:job_ui/src/widget/custom_image.dart';
import 'package:job_ui/src/widget/custom_sizedboxes.dart';
import 'package:job_ui/src/widget/custom_text.dart';
import 'package:job_ui/src/widget/custom_textfield.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDADADA),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryanimation) {
                    return ProfileDetailScreen();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutCubic;
                    var tween = Tween(
                      begin: begin,
                      end: end,
                    ).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  transitionDuration: Duration(seconds: 2),
                ));
          },
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: customImage(
                        "assets/images/images.jpg",
                        MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height * 0.6,
                        BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 20,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(Icons.arrow_back, color: Colors.white),
                                Spacer(),
                                Icon(Icons.menu, color: Colors.white),
                              ],
                            ),
                          ),
                          kSizedboxheight(
                              height: MediaQuery.of(context).size.height * 0.4),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText("Madara Uchiha",
                                    size: 30, whitecolor: true),
                                customText(
                                    "Don't tell anyone, but I'm Obito Uchiha",
                                    size: 12,
                                    whitecolor: true),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              kSizedboxheight(height: 20),
              Container(
                height: 7,
                width: 60,
                decoration: BoxDecoration(
                    color: Color(0xffC4C4C4),
                    borderRadius: BorderRadius.circular(10)),
              ),
              kSizedboxheight(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customColumn(
                      "49",
                      "Photos",
                    ),
                    customColumn("612", "Followers"),
                    customColumn("37", "Following"),
                  ],
                ),
              ),
              kSizedboxheight(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [button("Follow"), button("Message")],
              ),
              kSizedboxheight(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget customColumn(first, last) {
    return Column(
      children: [
        customText(first, size: 24, whitecolor: true),
        customText(last, size: 18, whitecolor: true)
      ],
    );
  }
}

Widget button(text, {bool check = false}) {
  return Container(
    padding: EdgeInsets.only(right: 30, left: 30, top: 10, bottom: 10),
    decoration: BoxDecoration(
      boxShadow: const [],
      border: GradientBoxBorder(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kcolorblack, kcolorwhite]),
        width: 4,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: customText(text, size: 17, whitecolor: check ? true : false),
    ),
  );
}
