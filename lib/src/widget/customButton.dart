import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_ui/src/helper/colors.dart';
import 'package:job_ui/src/helper/text_style.dart';

Widget custombutton(text) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            colors: [kcolorblack, kcolorgrey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)),
    child: Center(
      child: Text(
        text,
        style: ktextstyleWhite.copyWith(fontSize: 18),
      ),
    ),
  );
  // return ElevatedButton(
  //   onPressed: () {
  //     // Add your onPressed functionality here
  //   },
  //   style: ElevatedButton.styleFrom(

  //     elevation: 0, // Remove the shadow
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //     ),

  //   ),
  //   child: Ink(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       gradient: LinearGradient(
  //         colors: [kcolorblack, kcolorgrey],
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter,
  //       ),
  //     ),
  //     child: Container(
  //       height: 50,
  //       child: Center(
  //         child: Text(
  //           text,
  //           style: ktextstyleWhite.copyWith(fontSize: 18),
  //         ),
  //       ),
  //     ),
  //   ),
  // );
}

class Custombutton extends StatelessWidget {
  String text;
  bool isicon;
  Function ontap;

  Custombutton(
      {required this.text,
      this.isicon = false,
      required this.ontap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () {
          ontap();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0, // Adjust the elevation as needed
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(0),
        ),
        child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kcolorblack, kcolorgrey]),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 14, bottom: 14),
              alignment: Alignment.center,
              child: Text(
                text,
                style: ktextstyleWhite.copyWith(fontSize: 14.sp),
              ),
            )),
      ),
    );
  }
}
