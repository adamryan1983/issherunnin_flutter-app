import 'package:cloud_firestore/cloud_firestore.dart';

class LineupModel {
  String cars, side, location;

  LineupModel({this.cars, this.side, this.location});

  LineupModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    cars = doc['cars'];
    side = doc['side'];
    location = doc['geolocation'];
  }
}
