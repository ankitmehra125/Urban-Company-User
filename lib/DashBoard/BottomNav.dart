

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';  // Add this import
import 'package:usc_project/DashBoard/Profile/myProfile.dart';
import 'package:usc_project/DashBoard/Transport/movers.dart';
import 'package:usc_project/DashBoard/uscPlus/uscPlus_page.dart';

import 'Beauty/beauty_page.dart';
import 'Home/home_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    HomePage(),
    BeautyPage(),
    UscPlusPage(),
    Movers(),
    MyProfile()
  ];

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: _pages,
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,  // PageController
            count: _pages.length,
            effect: WormEffect(
              dotHeight: 12,
              dotWidth: 12,
              activeDotColor: Colors.black,
              dotColor: Colors.black45,
            ),  // your preferred effect
            onDotClicked: _onItemTapped,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(fontFamily: 'SatoshiMedium'),
        selectedFontSize: 12,
        unselectedItemColor: Colors.black45,
        unselectedFontSize: 12,
        unselectedLabelStyle: TextStyle(fontFamily: 'SatoshiMedium'),
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/dashboard_images/uscIcon.svg",
            ),
            label: "USC",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/dashboard_images/beautyIcon.svg",
              color: _selectedIndex == 1 ? Colors.black : Colors.black45,
            ),
            label: "Beauty",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/dashboard_images/uscPlusIcon.svg",
              color: _selectedIndex == 2 ? Colors.black : Colors.black45,
            ),
            label: "USC Plus",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/dashboard_images/truck.svg",
              color: _selectedIndex == 3 ? Colors.black : Colors.black45,
            ),
            label: "Transport",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/dashboard_images/circleProfile.svg",
              color: _selectedIndex == 4 ? Colors.black : Colors.black45,
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}