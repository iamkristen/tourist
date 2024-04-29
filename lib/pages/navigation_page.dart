import 'package:flutter/material.dart';
import 'package:tourist/misc/colors.dart';
import 'package:tourist/pages/navigation_page/bar_item_page.dart';
import 'package:tourist/pages/navigation_page/home_page.dart';
import 'package:tourist/pages/navigation_page/profile_page.dart';
import 'package:tourist/pages/navigation_page/search_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List Pages = [
    HomePage(),
    SearchPage(),
    BarItemPage(),
    ProfilePage(),
  ];
  int currentIndex = 0;
  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // selectedFontSize: 0,
          // unselectedFontSize: 0,
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.mainColor.withOpacity(.3),
          onTap: onTap,
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Bar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profile")
          ]),
    );
  }
}
