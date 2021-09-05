// import 'package:get/state_manager.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:issherunnin_flutter/models/ferrymodel.dart';

// class StatusController extends GetxController {
  
//   // CollectionReference referenceFlanders = FirebaseFirestore.instance.collection("flanders");
//   // CollectionReference referenceLegionnaire = FirebaseFirestore.instance.collection("legionnaire");
//   // CollectionReference referenceBeaumont = FirebaseFirestore.instance.collection("beaumont");

//   // onInit
//   @override
//   void onInit() {
//     finalFerryModel.bindStream(streamDemo());
//     fetchDocs();
//     super.onInit();
//   }

//     //
//   Rxn<List<FerryModel2>> finalFerryModel = Rxn<List<FerryModel2>>([]);

//   //
//   List<FerryModel2> get ferryModelList => finalFerryModel.value;

//   //
//   Stream<List<FerryModel2>> streamDemo() {
//     return FirebaseFirestore.instance
//         .collection('flanders')
//         .orderBy('datetime', descending: true)
//         .limitToLast(6)
//         .snapshots()
//         .map((ds) {
//         var mapData = ds.data();
//   List mapList = mapData['list'];
//   List<FerryModel2> newsModelList = [];
//   mapList.forEach((element) {
//     newsModelList.add(FerryModel2.fromMap(element));
//   });
//   return newsModelList;
//     });
//   }

// }