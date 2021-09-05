import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';

class InfoPage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => InfoPage(),
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
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Text('This app is created/maintained by Adam Ryan.',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Text('https://thisisadamryan.me',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
            
            Flexible(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text('You are running app version 1.2' + 
                    '\nThe following features have been added since v1.1: ' + 
                  '\n - Visual representation of boat condition on their names' +
                  '\n - Notifications on status changes',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)
                          )
                        ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: Text('This a community-driven product and depends on the cooperation of everyone as a whole to contribute accurate, sensible, and clean updates.',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
            Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
              child: Text(
                "This is an app for viewing and maintaining Ferry & Lineup information for the Bell Island/Portugal Cove-St.Philips ferry service",
                style: TextStyle(
                  color: AppColors.MAINTEXTBLACK,
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        )));
  }
}
