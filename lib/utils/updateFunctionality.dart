import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:issherunnin_flutter/controllers/authController.dart';
import '../subpages/user.dart';
import '../subpages/update.dart';

class UpdateFunction extends GetWidget<AuthController> {
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
    return UpdatePage();
  }
}
