import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:issherunnin_flutter/models/ferrymodel.dart';
import 'package:issherunnin_flutter/models/lineupmodel.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> updateFlanders(FerryModel ferryStatus) async {
    try {
      await _firestore.collection('flanders').add({
        'status': ferryStatus.status,
        'reason': ferryStatus.reason,
        'note': ferryStatus.note
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateLegionnaire(FerryModel ferryStatus) async {
    try {
      await _firestore.collection('legionnaire').add({
        'status': ferryStatus.status,
        'reason': ferryStatus.reason,
        'note': ferryStatus.note
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateLineup(LineupModel lineupModel) async {
    try {
      await _firestore.collection('lineup').add({
        'cars': lineupModel.cars,
        'side': lineupModel.side,
        'geolocation': lineupModel.location
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
