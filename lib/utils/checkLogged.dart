import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:issherunnin_flutter/controllers/authController.dart';
import '../subpages/user.dart';
import '../constants/Colors.dart';

class CheckLogged extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null)
          ? IsLogged()
          : NotLogged();
    });
  }
}

class NotLogged extends GetWidget<AuthController> {
  const NotLogged({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserPage();
  }
}

class IsLogged extends GetWidget<AuthController> {
  const IsLogged({Key key}) : super(key: key);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                controller.user,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            Image.asset('assets/images/logo.png',
                fit: BoxFit.cover, width: 250),
            Container(
              child: ElevatedButton(
                child: Text("Log Out"),
                onPressed: () {
                  controller.signOut();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
