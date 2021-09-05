import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String dateConvert(timestamp, raw) {
  final df = new DateFormat('dd-MM-yyyy hh:mm a');
  int myvalue = timestamp.seconds;
  var val = df.format(new DateTime.fromMillisecondsSinceEpoch(myvalue * 1000));

  return (val);
}

class LineupPage extends StatelessWidget {
  Widget _buildListItem(BuildContext context, DocumentSnapshot docs) {
    final Timestamp timestamp = docs['datetime'] as Timestamp;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            width: 120,
            padding: EdgeInsets.all(4.0),
            child: Text(
              dateConvert(timestamp, docs['datetime'])??'',
              style: TextStyle(fontSize: 12)??'na',
            )
            ),
        Container(
          width: 40,
          padding: EdgeInsets.all(4.0),
          child: Text(
            docs['cars']??'',
            style: TextStyle(fontSize: 12)??'na',
          ),
        ),
        Container(
          width: 120,
          padding: EdgeInsets.all(4.0),
          child: Text(
            docs['geolocation']??'',
            style: TextStyle(fontSize: 12)??'na',
          ),
        ),
        Container(
          width: 80,
          padding: EdgeInsets.all(4.0),
          child: Text(
            docs['side']??'n/a',
            style: TextStyle(fontSize: 12, color: AppColors.MAINTEXTBLACK)??'na',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/ferrylogo-horizontal.png',
            fit: BoxFit.cover, width: 300),
        toolbarHeight: 100,
        backgroundColor: AppColors.PRIMARY_COLOR,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20.0),
                child: Text("Lineup Updates",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        fontSize: 22))),
            Container(
              height: 40.0,
              color: AppColors.THIRD_COLOR,
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
                      width: 45,
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Cars",
                        style: TextStyle(fontSize: 15),
                      )),
                  Container(
                      width: 115,
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Location",
                        style: TextStyle(fontSize: 15),
                      )),
                  Container(
                      width: 80,
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Side",
                        style: TextStyle(fontSize: 15),
                      )),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: firestore
                    .collection('lineup')
                    .orderBy('datetime', descending: true)
                    .limit(7)
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
