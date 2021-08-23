import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/tab_navigation_items.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // This is all you need!
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        backgroundColor: AppColors.PRIMARY_COLOR,
        unselectedItemColor: AppColors.MAINBGWHITE,
        selectedItemColor: AppColors.FOURTH_COLOR,
        items: [
          for (final tabItem in TabNavigationItem.items)
            BottomNavigationBarItem(
              icon: tabItem.icon,
              label: tabItem.label,
            )
        ],
      ),
    );
  }
}
