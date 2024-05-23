import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Widget customImage(String image, double width, double height, BoxFit fit) {
  return kIsWeb == true
      ? Image.network(
          "assets/$image",
          width: width,
          height: height,
          fit: fit,
        )
      : Image.asset(
          image,
          width: width,
          height: height,
          fit: fit,
        );
}
