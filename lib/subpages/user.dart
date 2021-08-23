import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:issherunnin_flutter/controllers/authController.dart';
import 'package:issherunnin_flutter/subpages/signup.dart';

//ignore: must_be_immutable
class UserPage extends GetWidget<AuthController> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  String errorMessage;

  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => UserPage(),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Image.asset('assets/images/ferrylogo-horizontal.png',
              fit: BoxFit.cover, width: 300),
          toolbarHeight: 100,
          backgroundColor: AppColors.PRIMARY_COLOR,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Log In Existing User",
                  style: (TextStyle(fontSize: 22))),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        labelText: "Email",
                        // controller: passwordController,
                        hintText: "example@mail.com",
                      ),
                      autofocus: false,
                    ),
                    TextField(
                      controller: pass,
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      autofocus: false,
                      obscureText: true,
                    ),
                    Container(
                      width: 10,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      alignment: AlignmentDirectional.center,
                      child: SignInButtonBuilder(
                        text: 'Sign In',
                        icon: Icons.email,
                        onPressed: () {
                          controller.login(email.text, pass.text);
                        },
                        backgroundColor: Colors.blueGrey[700],
                        width: 220.0,
                      ),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.fromLTRB(50, 10.0, 50.0, 0),
                child: Text("Or",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18))),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                child: Container(
                    child: ElevatedButton(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: AppColors.MAINTEXTWHITE,
                            fontFamily: 'Poppins',
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey[700],
                        )))),
            Divider(),
            SignInButton(
              Buttons.GoogleDark,
              onPressed: () async {
                await controller.signInGoogle();
              },
            ),
            Divider(),
            SignInButton(
              Buttons.FacebookNew,
              onPressed: () async {
                await controller.signInWithFacebook();
              },
            ),
            Divider(),
            SignInButton(
              Buttons.Apple,
              onPressed: () async {
                await controller.signInWithApple();
              },
            ),
          ],
        ),
      ),
    );
  }
}
