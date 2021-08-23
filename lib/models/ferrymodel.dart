import 'package:cloud_firestore/cloud_firestore.dart';

class FerryModel {
  String status, reason, note;

  FerryModel({this.status, this.reason, this.note});

  FerryModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    status = doc['status'];
    reason = doc['reason'];
    note = doc['note'];
  }
}
