import 'package:cloud_firestore/cloud_firestore.dart';

class FerryModel {
  String status, reason, note;

  FerryModel({this.status, this.reason, this.note});

  factory FerryModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return FerryModel(
        status: doc['status'], reason: doc['reason'], note: doc['note']);
  }
}

class FerryModel2 {
  String status, reason, note;
  List aList;

  FerryModel2({this.status, this.reason, this.note, this.aList});

  factory FerryModel2.fromMap(dynamic doc) {
    return FerryModel2(
        status: doc['status'], reason: doc['reason'], note: doc['note']);
  }
}
