import 'package:carousel_slider/carousel_slider.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_ui/src/helper/colors.dart';
import 'package:job_ui/src/helper/icons.dart';
import 'package:job_ui/src/home/widgetsHome.dart';
import 'package:job_ui/src/widget/appbar.dart';
import 'package:job_ui/src/widget/custom_image.dart';
import 'package:job_ui/src/widget/custom_sizedboxes.dart';
import 'package:job_ui/src/widget/custom_text.dart';
import 'package:job_ui/src/widget/gridview.dart';

import '../helper/constants.dart';
import '../helper/text_style.dart';
import '../models/modeluser.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController controller = CarouselController();
  int currentindex = 0;
  bool statusCheck = true;
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;

    List checks = [
      true,
      false,
      true,
      true,
      false,
      false,
      true,
      false,
      false,
      true,
      true,
      true,
      false,
      false,
      true
    ];

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customAppBar(),
            kSizedboxheight(height: 20),
            if (statusCheck == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                    width: sw * 0.85,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (int i = 0; i <= 10; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: status(list[i], checks[i]),
                          )
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          statusCheck = false;
                        });
                      },
                      child: customImage(kIconForward, 15, 15, BoxFit.contain))
                ],
              ),
            kSizedboxheight(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                
                  "Feed",
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                  style: ktextstyleBlack.copyWith(
                      fontSize: 34.sp, fontWeight: FontWeight.w700),
                ),
                if (statusCheck == false)
                  InkWell(
                      onTap: () {
                        setState(() {
                          statusCheck = true;
                        });
                      },
                      child: customImage(kiconbackword, 15, 15, BoxFit.contain))
              ],
            ),
            kSizedboxheight(height: 20),
            ListView.builder(
                itemCount: 15,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return post(names[index], "44", list[index],
                      usersPost[index].cateogry, sw,
                      description: usersPost[index].description,
                      slider: usersPost[index].morePictures);
                })
          ],
        ),
      ))),
    );
  }

  List<String> names = List.generate(30, (index) => faker.person.name());

  Widget post(
      String name, String time, String image, String category, double sw,
      {String description = "", bool slider = false}) {
    List<Widget> items = [
      design(sw),
      design(sw),
      design(sw),
    ];
    return Column(
      children: [
        rowWidget(image, name, time),
        kSizedboxheight(height: 10),
        if (description.isNotEmpty)
          Align(
              alignment: Alignment.bottomLeft,
              child: customText(description, size: 14)),
        kSizedboxheight(height: 10),
        if (slider == true) ...[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  items.length,
                  (index) => currentindex == index
                      ? Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: kcolorblack.withOpacity(0.7),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.grey.withOpacity(0.7),
                          ),
                        ))),
          kSizedboxheight(height: 5),
          SizedBox(
            height: sw * 0.6,
            child: CarouselSlider(
              carouselController: controller,
              items: items,
              options: CarouselOptions(
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  scrollPhysics: BouncingScrollPhysics(),
                  aspectRatio: 1.8,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentindex = index;
                    });
                  }),
            ),
          ),
        ] else ...[
          Container(
            clipBehavior: Clip.hardEdge,
            width: sw * 0.8,
            height: sw * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              image,
              width: 300,
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        ],
        kSizedboxheight(height: 10),
        SizedBox(
          width: sw * 0.8,
          child: Row(
            children: [
              customImage(kIconHeart, 20, 18, BoxFit.contain),
              kSizedboxWidth(width: 8),
              customImage(kIconComment, 20, 18, BoxFit.contain),
              kSizedboxWidth(width: 8),
              customImage(kIconShare, 20, 18, BoxFit.contain),
              Spacer(),
              customText("Category: $category", size: 12)
            ],
          ),
        ),
        kSizedboxheight(height: 25),
      ],
    );
  }

  Widget design(sw) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: sw * 0.8,
      height: sw * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.network(
        faker.image.image(),
        width: sw * 0.8,
        height: sw * 0.7,
        fit: BoxFit.fill,
      ),
    );
  }
}
