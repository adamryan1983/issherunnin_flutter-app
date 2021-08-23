import 'package:get/get.dart';
import 'package:issherunnin_flutter/controllers/boatController.dart';

class BoatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoatController>(() => BoatController());
  }
}
