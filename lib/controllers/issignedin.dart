import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../subpages/user.dart';
import '../subpages/home.dart';
import 'authController.dart';

class IsSignedIn extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthController>().user != null ? HomePage() : UserPage();
    });
  }
}
