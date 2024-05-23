import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_ui/src/helper/colors.dart';
import 'package:job_ui/src/helper/text_style.dart';

import 'custom_image.dart';

class CustomTextFeild extends StatefulWidget {
  String prefixIcon;
  String suffixIcon;
  TextEditingController controller;
  String labelText;
  bool obscureText;
  double width;
  double height;
  bool grey;
  var maxlines;
  final Function? ontap;

  CustomTextFeild(
      {this.prefixIcon = "",
      this.labelText = "",
      required this.controller,
      this.suffixIcon = "",
      this.obscureText = false,
      this.width = 20,
      this.height = 20,
      this.maxlines = 1,
      this.ontap,
      this.grey = false,
      super.key});

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: kcolorgrey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: widget.controller,
        style: widget.grey == false
            ? ktextstyleBlack.copyWith(fontSize: 12.sp)
            : ktextstyleWhite.copyWith(fontSize: 12.sp),
        maxLines: widget.maxlines,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          hintText: widget.labelText,
          hintStyle: widget.grey == false
              ? ktextstyleBlack.copyWith(
                  fontSize: 12.sp,
                  color: kcolorgrey.withOpacity(0.5),
                )
              : ktextstyleWhite.copyWith(fontSize: 12.sp),
          prefixIconConstraints: BoxConstraints(
              maxHeight: 30, maxWidth: 30, minHeight: 20, minWidth: 20),
          prefixIcon: widget.prefixIcon == ""
              ? null
              : Container(
                  margin: EdgeInsets.only(right: 5),
                  child: customImage(widget.prefixIcon, widget.width,
                      widget.height, BoxFit.contain)),
          suffixIconConstraints: BoxConstraints(
              maxHeight: 30, maxWidth: 30, minHeight: 20, minWidth: 20),
          suffixIcon: widget.suffixIcon == ""
              ? null
              : InkWell(
                  onTap: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  child: customImage(widget.suffixIcon, widget.width,
                      widget.height, BoxFit.contain)),
        ),
        obscureText: widget.obscureText,
      ),
    );
  }
}
