import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_ui/src/helper/icons.dart';
import 'package:job_ui/src/helper/text_style.dart';

import 'custom_image.dart';
import 'custom_text.dart';

Widget customAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Hi Dave.",
        style: ktextstyleBlack.copyWith(
            fontSize: 24.sp, fontWeight: FontWeight.w700),
      ),
      customImage(kIconChat, 24, 24, BoxFit.contain),
    ],
  );
}
