import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/pages/mainpages/card.dart';
import 'package:plant_app/pages/mainpages/favorite_page.dart';
import 'package:plant_app/pages/mainpages/home_page.dart';
import 'package:plant_app/pages/mainpages/profile_page.dart';
import 'package:plant_app/pages/mainpages/scan_page.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int bottomIndex = 0;
  List<Widget> mypages = const [
    HomePage(),
    FavoritePage(),
    CardPage(),
    ProfilePage(),
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person_pin,
  ];

  List<String> appBarTitles = [
    'خانه',
    'علاقه‌مندی‌ها',
    'سبد‌خرید',
    'پروفایل',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notifications,
                color: MyConstants.blackcolor,
                size: 33,
              ),
              Text(
                appBarTitles[bottomIndex],
                style: TextStyle(
                    color: MyConstants.blackcolor,
                    fontSize: 27,
                    fontFamily: 'Lalezar'),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: IndexedStack(
        index: bottomIndex,
        children: mypages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
                child: const ScanPage(), type: PageTransitionType.topToBottom),
          );
        },
        backgroundColor: MyConstants.primarycolor,
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: MyConstants.primarycolor,
        activeColor: MyConstants.primarycolor,
        activeIndex: bottomIndex,
        inactiveColor: Colors.black.withOpacity(0.5),
        gapLocation: GapLocation.center,
        icons: iconList,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
      ),
    );
  }
}
