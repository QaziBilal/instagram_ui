import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:job_ui/src/home/profile.dart';
import 'package:job_ui/src/widget/custom_image.dart';
import 'package:job_ui/src/widget/custom_sizedboxes.dart';
import 'package:job_ui/src/widget/custom_text.dart';

import '../helper/colors.dart';
import '../widget/gridview.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDADADA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    Icons.arrow_back,
                    color: kcolorwhite,
                  ),
                ),
              ),
            ),
            kSizedboxheight(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child:
                      customText("Mohiba Uchiha", size: 18, whitecolor: true)),
            ),
            Container(
              height: 7,
              width: 60,
              decoration: BoxDecoration(
                  color: kcolorwhite, borderRadius: BorderRadius.circular(10)),
            ),
            kSizedboxheight(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: customImage(
                        "assets/images/images.jpg", 100, 100, BoxFit.cover),
                  ),
                  kSizedboxWidth(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            customColumn(
                              "49",
                              "Photos",
                            ),
                            customColumn(
                              "612",
                              "Followers",
                            ),
                            customColumn(
                              "37",
                              "Following",
                            ),
                          ],
                        ),
                        kSizedboxheight(height: 10),
                        customText("Don't tell anyone but i am jha",
                            size: 14, whitecolor: true, align: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kSizedboxheight(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("Follow", check: true),
                button("Message", check: true)
              ],
            ),
            kSizedboxheight(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i <= 5; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(list[i]),
                        ),
                      )
                  ],
                ),
              ),
            ),
            kSizedboxheight(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: gridview(),
            )
          ],
        ),
      ),
    );
  }

  Widget customColumn(first, last) {
    return Column(
      children: [
        customText(first, size: 18, whitecolor: true),
        customText(last, size: 12, whitecolor: true)
      ],
    );
  }
}
