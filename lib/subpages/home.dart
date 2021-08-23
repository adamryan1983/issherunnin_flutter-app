import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import '../utils/root.dart';

class HomePage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Image.asset('assets/images/ferrylogo-horizontal.png',
              fit: BoxFit.cover, width: 300),
          toolbarHeight: 100,
          backgroundColor: AppColors.PRIMARY_COLOR,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Text('Welcome',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600))),
            Image.asset('assets/images/logo.png',
                fit: BoxFit.cover, width: 250),
            Container(
              padding: EdgeInsets.fromLTRB(30, 60, 30, 20),
              child: Text(
                "This is an app for viewing and maintaining Ferry & Lineup information for the Bell Island/Portugal Cove-St.Philips ferry service",
                style: TextStyle(
                  color: AppColors.MAINTEXTBLACK,
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                ),
              ),
            ),
            Container(child: CheckLogged()),
          ],
        )));
  }
}
