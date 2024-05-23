import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:job_ui/src/helper/colors.dart';
import 'package:job_ui/src/home/widgetsHome.dart';
import 'package:job_ui/src/widget/appbar.dart';
import 'package:job_ui/src/widget/custom_sizedboxes.dart';
import 'package:job_ui/src/widget/custom_text.dart';
import 'package:job_ui/src/widget/gridview.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: -400,
                left: -200,
                child: CircleAvatar(
                  backgroundColor: kcolorgrey.withOpacity(0.2),
                  radius: 300,
                )),
            Positioned(
                top: -200,
                left: 110,
                child: CircleAvatar(
                  backgroundColor: kcolorgrey.withOpacity(0.2),
                  radius: 250,
                )),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 35, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customAppBar(),
                    customText("Alerts", size: 36),
                    kSizedboxheight(height: 20),
                    for (int i = 0; i <= 10; i++) ...[
                      rowWidget(list[i], sportNames[i], "1", alert: true),
                      kSizedboxheight(height: 20)
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
