import 'package:flutter/material.dart';
import 'flanders.dart';
import 'legionnaire.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';

class FerryPage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => FerryPage(),
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
                  "Flanders",
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
                ),
                Text(
                  "Legionnaire",
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
                ),
              ],
            ),
            title: Image.asset('assets/images/ferrylogo-horizontal.png',
                fit: BoxFit.cover, width: 300),
            toolbarHeight: 100,
            backgroundColor: AppColors.PRIMARY_COLOR,
          ),
          body: TabBarView(
            children: [Flanders(), Legionnaire()],
          ),
        ),
      ),
    );
  }
}
