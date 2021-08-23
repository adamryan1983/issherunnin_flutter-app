import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:issherunnin_flutter/subpages/update/updateLineup.dart';
import 'package:issherunnin_flutter/subpages/update/updateBoat.dart';

class UpdatePage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => UpdatePage(),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text(
                  "Update Lineup",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                ),
                Text(
                  "Update Ferry",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                ),
              ],
            ),
            title: Image.asset('assets/images/ferrylogo-horizontal.png',
                fit: BoxFit.cover, width: 300),
            toolbarHeight: 100,
            backgroundColor: AppColors.PRIMARY_COLOR,
          ),
          body: TabBarView(
            children: [UpdateLineup(), UpdateBoat()],
          ),
        ),
      ),
    );
  }
}
