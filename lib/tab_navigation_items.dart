import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/subpages/ferry.dart';
import 'package:issherunnin_flutter/subpages/home.dart';
import 'package:issherunnin_flutter/subpages/lineup.dart';
import './utils/checkLogged.dart';
import './utils/updateFunctionality.dart';

class TabNavigationItem {
  final Widget page;
  final String label;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.label,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomePage(),
          icon: Icon(Icons.home),
          label: "Home",
        ),
        TabNavigationItem(
          page: FerryPage(),
          icon: Icon(Icons.directions_boat_outlined),
          label: "Ferry",
        ),
        TabNavigationItem(
          page: UpdateFunction(),
          icon: Icon(Icons.add, size: 40),
          label: "Update",
        ),
        TabNavigationItem(
          page: LineupPage(),
          icon: Icon(Icons.directions_car_outlined),
          label: "Lineup",
        ),
        TabNavigationItem(
          page: CheckLogged(),
          icon: Icon(Icons.person),
          label: "User",
        ),
      ];
}
