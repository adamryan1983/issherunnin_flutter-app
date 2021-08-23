import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:issherunnin_flutter/controllers/authController.dart';
import '../tabs.dart';
import 'package:get/get.dart';

class LineupController extends GetxController {
  final selectedSide = 'Please select a side'.obs;
  void setSelectedSide(String value) {
    selectedSide.value = value;
  }

  // ignore: must_call_super
  void onInit() {}

  void setLineupStatus(String cars, String side, String location) async {
    if (side == 'Please select a side' || side == '') {
      side = 'Bell Island';
    }
    CollectionReference reference =
        FirebaseFirestore.instance.collection("lineup");
    Map<String, dynamic> userdata = {
      "datetime": DateTime.now(),
      "cars": cars,
      "side": side,
      "geolocation": location,
      "user": Get.find<AuthController>().user,
    };
    await reference
        .add(userdata)
        .then((value) => Get.offAll(TabsPage()).catchError(
              (onError) => Get.snackbar(
                  "Error while updating Lineup Status ", onError.message,
                  snackPosition: SnackPosition.BOTTOM),
            ));
  }
}
