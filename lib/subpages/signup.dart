import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:get/get.dart';
import 'package:issherunnin_flutter/controllers/authController.dart';

class Signup extends GetWidget<AuthController> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController firstn = TextEditingController();
  final TextEditingController lastn = TextEditingController();

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
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Sign Up",
                    style: (TextStyle(
                      fontSize: 22,
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        controller: firstn,
                        decoration: InputDecoration(
                          labelText: "First Name",
                          hintText: "John",
                        ),
                        autofocus: false,
                      ),
                      TextField(
                        controller: lastn,
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          hintText: "Smith",
                        ),
                        autofocus: false,
                      ),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "example@mail.com",
                        ),
                        autofocus: false,
                      ),
                      TextField(
                        controller: password,
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
                          text: 'Sign Up',
                          icon: Icons.email,
                          onPressed: () {
                            controller.createUser(firstn.text, lastn.text,
                                email.text, password.text);
                          },
                          backgroundColor: Colors.blueGrey[700],
                          width: 180.0,
                        ),
                      ),
                      Container(
                        width: 20,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: AlignmentDirectional.center,
                        child: SignInButtonBuilder(
                          text: 'Back',
                          icon: Icons.arrow_back_outlined,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          backgroundColor: Colors.red[700],
                          width: 100.0,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
