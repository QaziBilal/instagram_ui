import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../helper/colors.dart';

List<String> list =
    List.generate(30, (index) => faker.image.image(random: true));

Widget gridview({bool explore = false}) {
  return GridView.custom(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 3,
          pattern: [
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(2, 2),
            const QuiltedGridTile(2, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(2, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(2, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
          ],
          crossAxisSpacing: explore == false ? 10 : 2,
          mainAxisSpacing: explore == false ? 10 : 2,
          repeatPattern: QuiltedGridRepeatPattern.inverted),
      childrenDelegate:
          SliverChildBuilderDelegate(childCount: 15, (context, index) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: kcolorgrey,
            borderRadius: explore == false
                ? BorderRadius.circular(10)
                : BorderRadius.zero,
          ),
          child: CachedNetworkImage(
            imageUrl: list[index],
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        color: kcolorblack, value: downloadProgress.progress)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        );
      }));
}
