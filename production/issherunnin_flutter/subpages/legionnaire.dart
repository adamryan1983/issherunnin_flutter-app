import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String dateConvert(timestamp, raw) {
  final df = new DateFormat('dd-MM-yyyy hh:mm a');
  int myvalue = timestamp.seconds;
  var val = df.format(new DateTime.fromMillisecondsSinceEpoch(myvalue * 1000));

  return val;
}

class Legionnaire extends StatelessWidget {
  // DateFormat _dateFormat = DateFormat('y-MM-d');
  Widget _buildListItem(BuildContext context, DocumentSnapshot docs) {
    final Timestamp timestamp = docs['datetime'] as Timestamp;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            width: 120,
            padding: EdgeInsets.all(4.0),
            child: Text(
              dateConvert(timestamp, docs['datetime']),
              // DateTime.fromMicrosecondsSinceEpoch(docs['datetime']).toDate().toString(),
              style: TextStyle(fontSize: 12),
            )),
        Container(
          width: 60,
          padding: EdgeInsets.all(4.0),
          child: Text(
            docs['status'],
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          width: 100,
          padding: EdgeInsets.all(4.0),
          child: Text(
            docs['reason'],
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          width: 80,
          padding: EdgeInsets.all(4.0),
          child: Text(
            docs['note'],
            style: TextStyle(fontSize: 12, color: AppColors.MAINTEXTBLACK),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20.0),
            child: Text("Legionnaire Updates",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                    fontSize: 22))),
        Container(
          height: 40.0,
          color: AppColors.FIFTH_COLOR,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: 120,
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Date/Time",
                    style: TextStyle(fontSize: 15),
                  )),
              Container(
                  width: 60,
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Status",
                    style: TextStyle(fontSize: 15),
                  )),
              Container(
                  width: 100,
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Reason",
                    style: TextStyle(fontSize: 15),
                  )),
              Container(
                  width: 80,
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Notes",
                    style: TextStyle(fontSize: 15),
                  )),
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder(
              stream: firestore
                  .collection('legionnaire')
                  .orderBy('datetime', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.data.docs.length > 0) {
                    return ListView.builder(
                      itemExtent: 80.0,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) =>
                          _buildListItem(context, snapshot.data.docs[index]),
                    );
                  } else {
                    return Center(child: Text('No items found'));
                  }
                }
              }),
        ),
      ],
    ));
  }
}
