// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:issherunnin_flutter/constants/Colors.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
// import 'package:get/get.dart';
// import 'package:issherunnin_flutter/controllers/statusBoatController.dart';
// import 'package:issherunnin_flutter/models/ferrymodel.dart';

// String dateConvert(timestamp, raw) {
//   final df = new DateFormat('dd-MM-yyyy hh:mm a');
//   int myvalue = timestamp.seconds;
//   var val = df.format(new DateTime.fromMillisecondsSinceEpoch(myvalue * 1000));

//   return val;
// }

// class Flanders extends StatefulWidget {
//   @override
//   _FlandersState createState() => _FlandersState();
// }

// class _FlandersState extends State<Flanders> {
//   //
//   final StatusController _controller = Get.put<StatusController>(StatusController());

//   Widget _buildListItem(BuildContext context, DocumentSnapshot docs) {
//     final Timestamp timestamp = docs['datetime'] as Timestamp;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Container(
//           width: 120,
//           padding: EdgeInsets.all(4.0),
//           child: Text(
//             dateConvert(timestamp, docs['datetime']),
//             style: TextStyle(fontSize: 12),
//           ),
//         ),
//         Container(
//           width: 60,
//           padding: EdgeInsets.all(4.0),
//           child: Text(
//             docs['status'],
//             style: TextStyle(fontSize: 12),
//           ),
//         ),
//         Container(
//           width: 90,
//           padding: EdgeInsets.all(4.0),
//           child: Text(
//             docs['reason'],
//             style: TextStyle(fontSize: 12),
//           ),
//         ),
//         Container(
//           width: 90,
//           padding: EdgeInsets.all(4.0),
//           child: Text(
//             docs['note'],
//             style: TextStyle(fontSize: 12, color: AppColors.MAINTEXTBLACK),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.all(20.0),
//             child: Text(
//               "Flanders",
//               style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontFamily: 'Montserrat',
//                   color: Colors.blue,
//                   fontSize: 22),
//             ),
//           ),
//           Container(
//             height: 40.0,
//             color: AppColors.FOURTH_COLOR,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Container(
//                   width: 120,
//                   padding: EdgeInsets.all(4.0),
//                   child: Text(
//                     "Date/Time",
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//                 Container(
//                   width: 60,
//                   padding: EdgeInsets.all(4.0),
//                   child: Text(
//                     "Status",
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//                 Container(
//                   width: 90,
//                   padding: EdgeInsets.all(4.0),
//                   child: Text(
//                     "Reason",
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//                 Container(
//                   width: 90,
//                   padding: EdgeInsets.all(4.0),
//                   child: Text(
//                     "Notes",
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Obx((){
//         if (_controller.ferryModelList == null) {
//           return Text('Loading');
//         } else if (_controller.ferryModelList.isEmpty) {
//           return Text('Empty List');
//         } else {
//             return ListView.builder(
//               itemExtent: 80.0,
//               itemCount: _controller.ferryModelList.length,
//               itemBuilder: (context, index) {
//                 final FerryModel2 _ferryModel = _controller.ferryModelList[index];
//                 return
                  
//               });
//             }
//             }
//           )
//         )
//       ]      
//     )
//     );
//   }
// }
