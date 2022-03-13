import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_edge_hack/screens/chat_screen.dart';
import 'package:high_edge_hack/screens/messages_screen.dart';
import 'package:high_edge_hack/screens/profile_screen.dart';
import 'package:high_edge_hack/screens/tabs/tabs_groups_events.dart';
import 'package:high_edge_hack/screens/tutors_search_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final List<Widget> _pages = [
    ProfileScreen(isTeacher: false),
    ChatScreen(),
    TabsGroupsEvents(),
    TutorsSearchScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ProfileScreen(isTeacher: false),
              ),
            );
            break;
          case 1:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MessagesScreen(),
              ),
            );
            break;
          case 2:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => TabsGroupsEvents(),
              ),
            );
            break;
          case 3:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => TutorsSearchScreen(),
              ),
            );
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).primaryColor,
      showUnselectedLabels: true,
      selectedFontSize: 11.sp,
      unselectedFontSize: 11.sp,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      currentIndex: _selectedPageIndex,
      items: [
        BottomNavigationBarItem(
          icon: bottomNavBarIcons(
            image: 'assets/images/bottom_nav_bar_profile_icon.png',
            width: 22.w,
            height: 29.h,
          ),
          label: 'Профиль',
        ),
        BottomNavigationBarItem(
          icon: bottomNavBarIcons(
            image: 'assets/images/bottom_nav_bar_chat_icon.png',
            width: 27.w,
            height: 27.h,
          ),
          label: 'Чат',
        ),
        BottomNavigationBarItem(
          icon: bottomNavBarIcons(
            image: 'assets/images/bottom_nav_bar_groups_icon.png',
            width: 25.w,
            height: 29.h,
          ),
          label: 'Группы',
        ),
        BottomNavigationBarItem(
          icon: bottomNavBarIcons(
            image: 'assets/images/bottom_nav_bar_tutor_icon.png',
            width: 26.w,
            height: 26.h,
          ),
          label: 'Репетитор',
        ),
      ],
    );
  }
}

Widget bottomNavBarIcons({
  required String image,
  required double width,
  required double height,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    width: width,
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
      ),
    ),
  );
}
