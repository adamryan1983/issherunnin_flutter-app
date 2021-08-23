import 'package:get/get.dart';
import 'package:issherunnin_flutter/controllers/boatController.dart';
import 'package:issherunnin_flutter/controllers/lineupController.dart';
import 'authController.dart';

class AuthBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<BoatController>(() => BoatController());
    Get.lazyPut<LineupController>(() => LineupController());
  }
}
