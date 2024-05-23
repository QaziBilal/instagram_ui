import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_ui/src/helper/colors.dart';
import 'package:job_ui/src/helper/text_style.dart';
import 'package:job_ui/src/home/alerts.dart';
import 'package:job_ui/src/home/explore.dart';
import 'package:job_ui/src/home/homeScreen.dart';
import 'package:job_ui/src/home/profile.dart';

class HomwPage extends StatefulWidget {
  @override
  _HomwPageState createState() => _HomwPageState();
}

class _HomwPageState extends State<HomwPage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: kcolorwhite,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? columnText("Home")
                : Icon(
                    Icons.home_outlined,
                    color: kcolorgrey,
                    size: 24,
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? columnText("Explore")
                : Icon(
                    Icons.search,
                    color: kcolorgrey,
                    size: 24,
                  ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 18,
              backgroundColor: kcolorblack,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: kcolorwhite,
                  size: 24,
                ),
              ),
            ),
            label: 'add',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? columnText("Alerts")
                : Icon(
                    Icons.notifications_outlined,
                    color: kcolorgrey,
                    size: 24,
                  ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? columnText("Profile")
                : Icon(
                    Icons.person_outline,
                    color: kcolorgrey,
                    size: 24,
                  ),
            label: 'Profile',
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      //   onPressed: () {},
      //   mini: true,
      //   child: Icon(
      //     Icons.add,
      //     color: kcolorwhite,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return ExploreScreen();
      case 3:
        return AlertsScreen();
      case 4:
        return ProfileScreen();
      default:
        return const Center(child: Text('Invalid Page'));
    }
  }

  Widget columnText(text) {
    return Column(
      children: [
        Text(
          text,
          style: ktextstyleBlack.copyWith(
              color: kcolortext, fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        Container(
          width: 30,
          height: 3,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
        )
      ],
    );
  }
}
