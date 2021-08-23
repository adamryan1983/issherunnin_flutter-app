import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:issherunnin_flutter/constants/Colors.dart';

class UserPage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => UserPage(),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Image.asset('assets/images/ferrylogo-horizontal.png',
                  fit: BoxFit.cover, width: 300),
              toolbarHeight: 100,
              backgroundColor: AppColors.PRIMARY_COLOR,
            ),
            body: new Container(
              child: new Center(
                  child: MergeSemantics(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Material(
                              elevation: 24.0,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                    child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: AppColors.MAINTEXTBLACK,
                                    fontFamily: 'Poppins',
                                    fontSize: 22.0,
                                  ),
                                )),
                              ),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: "Email",
                                        hintText: "example@mail.com",
                                      ),
                                      autofocus: true,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                      ),
                                      autofocus: true,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      // height: double.infinity,
                                      child: ElevatedButton(
                                        child: Text(
                                          "Register",
                                          style: TextStyle(
                                            color: AppColors.MAINTEXTBLACK,
                                            fontFamily: 'Poppins',
                                            fontSize: 22.0,
                                          ),
                                        ),
                                        onPressed: () => print('Registered'),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 70.0, 0, 0),
                          child: Card(
                              borderOnForeground: true,
                              child: ElevatedButton(
                                child: Text("Sign In",
                                    style: TextStyle(
                                      color: AppColors.MAINTEXTBLACK,
                                      fontFamily: 'Poppins',
                                      fontSize: 22.0,
                                    )),
                                onPressed: () => print('Signed In'),
                              )))
                    ],
                  ),
                ),
              )),
            )));
  }
}
