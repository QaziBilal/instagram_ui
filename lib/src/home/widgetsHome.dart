import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_ui/src/helper/text_style.dart';
import 'package:job_ui/src/widget/custom_sizedboxes.dart';
import 'package:job_ui/src/widget/gridview.dart';

import '../helper/colors.dart';
import '../widget/custom_image.dart';
import '../widget/custom_text.dart';

Widget status(image, bool seen) {
  return CircleAvatar(
    radius: 30.r,
    backgroundColor: seen == true ? kcolorgrey : kcolorblack,
    child: CircleAvatar(
      radius: 28.r,
      backgroundColor: kcolorwhite,
      child: CircleAvatar(
        radius: 25.r,
        backgroundImage: NetworkImage(image),
      ),
    ),
  );
}

Widget rowWidget(image, name, time, {bool alert = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      status(image, true),
      kSizedboxWidth(width: 15),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: name,
                style: ktextstyleBlack.copyWith(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              TextSpan(
                  text: " created a new Post",
                  style: ktextstyleBlack.copyWith(fontSize: 14.sp))
            ])),
            Text(
              "$time min ago",
              style: ktextstyleBlack.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200,
                  color: kcolorgrey),
            ),
          ],
        ),
      ),
      kSizedboxWidth(width: 30),
      alert == false
          ? Row(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: kcolorgrey.withOpacity(0.5),
                        ),
                      )),
            )
          : CircleAvatar(
              backgroundColor: kcolorblack,
              radius: 15,
              child: Center(child: customText("2", whitecolor: true)),
            ),
    ],
  );
}
