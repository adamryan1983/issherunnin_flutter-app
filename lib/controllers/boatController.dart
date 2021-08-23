import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:issherunnin_flutter/controllers/authController.dart';
import '../tabs.dart';
import 'package:get/get.dart';

class BoatController extends GetxController {
  final selected = 'Please select a status'.obs;
  void setSelected(String value) {
    selected.value = value;
  }

  @override
  // ignore: must_call_super
  void onInit() {}

  setLegionnaireStatus(String status, String reason, String note) async {
    if (status == 'Please select a status') {
      status = 'delayed';
    }

    CollectionReference reference =
        FirebaseFirestore.instance.collection("legionnaire");

    Map<String, dynamic> legionnaire = {
      "datetime": DateTime.now(),
      "status": status,
      "reason": reason,
      "note": note,
      "user": Get.find<AuthController>().user,
    };
    await reference.add(legionnaire).then(
          (value) => Get.off(TabsPage()).catchError(
            (onError) => Get.snackbar(
                "Error while updating Ferry Status ", onError.message,
                snackPosition: SnackPosition.BOTTOM),
          ),
        );
  }

  setFlandersStatus(String status, String reason, String note) async {
    if (status == 'Please select a status') {
      status = 'delayed';
    }

    CollectionReference reference =
        FirebaseFirestore.instance.collection("flanders");
    Map<String, dynamic> flanders = {
      "datetime": DateTime.now(),
      "status": status,
      "reason": reason,
      "note": note,
      "user": Get.find<AuthController>().user,
    };
    await reference
        .add(flanders)
        .then((value) => Get.offAll(TabsPage()).catchError(
              (onError) => Get.snackbar(
                  "Error while updating Ferry Status ", onError.message,
                  snackPosition: SnackPosition.BOTTOM),
            ));
  }
}
