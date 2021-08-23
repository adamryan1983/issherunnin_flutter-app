import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';

class HomePage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/ferrylogo-horizontal.png',
            fit: BoxFit.cover, width: 300),
        toolbarHeight: 100,
        backgroundColor: AppColors.PRIMARY_COLOR,
      ),
      body: Center(
        child: Text(
          "Hello, Home!",
          style: TextStyle(
            color: AppColors.MAINTEXTBLACK,
            fontFamily: 'Montserrat',
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
