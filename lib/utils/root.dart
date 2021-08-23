import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:issherunnin_flutter/controllers/authController.dart';

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

class NotLogged extends StatelessWidget {
  const NotLogged({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Not Logged In: update functionality disabled',
          style: TextStyle(color: Colors.red[400])),
    );
  }
}

class IsLogged extends GetWidget<AuthController> {
  const IsLogged({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('You are logged in as: ' + controller.user,
          style: TextStyle(
              color: AppColors.SECONDARY_COLOR, fontWeight: FontWeight.w600)),
    );
  }
}
