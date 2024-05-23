import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/text_style.dart';

Widget customText(String text,
    {double size = 10, bool whitecolor = false, bool align = false}) {
  return Text(
    text,
    style: whitecolor == false
        ? ktextstyleBlack.copyWith(
            fontSize: size.sp, fontWeight: FontWeight.w200)
        : ktextstyleWhite.copyWith(
            fontSize: size.sp, fontWeight: FontWeight.w200),
    textAlign: align ? TextAlign.center : TextAlign.justify,
  );
}
