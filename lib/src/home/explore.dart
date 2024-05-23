import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:job_ui/src/helper/colors.dart';
import 'package:job_ui/src/helper/icons.dart';
import 'package:job_ui/src/helper/text_style.dart';
import 'package:job_ui/src/home/profiel_details.dart';
import 'package:job_ui/src/widget/custom_image.dart';
import 'package:job_ui/src/widget/custom_sizedboxes.dart';
import 'package:job_ui/src/widget/custom_textfield.dart';

import '../widget/gridview.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  TextEditingController _serach = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 8, vsync: this);

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, right: 20, left: 20),
              color: kcolorblack,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            color: kcolorgrey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: CustomTextFeild(
                          controller: _serach,
                          prefixIcon: "assets/icons/Search.png",
                          grey: true,
                          labelText: "Search",
                        ),
                      )),
                      kSizedboxWidth(width: 10),
                      customImage(kIconLive, 30, 30, BoxFit.cover)
                    ],
                  ),
                  kSizedboxheight(height: 10),
                  TabBar(
                    labelPadding: EdgeInsets.only(right: 15),
                    indicatorPadding: EdgeInsets.all(0),
                    controller: _tabController,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    dividerColor: kcolorblack,
                    tabs: [
                      tabbarWidget("TV"),
                      tabbarWidget("Show"),
                      tabbarWidget("Style"),
                      tabbarWidget("Sports"),
                      tabbarWidget("Auto"),
                      tabbarWidget("Auto"),
                      tabbarWidget("Auto"),
                      tabbarWidget("Auto"),
                    ],
                  ),
                  kSizedboxheight(height: 10),
                ],
              ),
            ),
            gridview(explore: true)
          ],
        ),
      )),
    );
  }

  Widget tabbarWidget(text) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
          border: Border.all(color: kcolorgrey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          customImage(kIconTV, 20, 20, BoxFit.cover),
          kSizedboxWidth(width: 7),
          Text(
            text,
            style: ktextstyleWhite.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
