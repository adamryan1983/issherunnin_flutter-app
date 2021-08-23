import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateFlanders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.MAINTEXTWHITE, //change your color here
        ),
        title: Image.asset('assets/images/ferrylogo-horizontal.png',
            fit: BoxFit.cover, width: 300),
        toolbarHeight: 100,
        backgroundColor: AppColors.PRIMARY_COLOR,
        centerTitle: true,
      ),
      body: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.7,
          child: BoatStatusWidget()
          // child: Text(
          //   "Update Flanders",
          //   style: TextStyle(
          //     color: AppColors.MAINTEXTBLACK,
          //     fontFamily: 'Poppins',
          //     fontSize: 22.0,
          //   ),
          // ),
          ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class BoatStatusWidget extends StatefulWidget {
  const BoatStatusWidget({Key key}) : super(key: key);

  @override
  _BoatUpdateStatus createState() => _BoatUpdateStatus();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BoatUpdateStatus extends State<BoatStatusWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Form(
            key: _formKey,
            child: Container(
              padding: new EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Material(
                        elevation: 5,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                            child: Text("Update Flanders' Status",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600)))),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter the status: ',
                        ),
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please choose a status';
                          }
                          return null;
                        },
                      )),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter the reason(if known): ',
                        ),
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the reason';
                          }
                          return null;
                        },
                      )),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter any notes: ',
                        ),
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some notes';
                          }
                          return null;
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (!_formKey.currentState.validate()) {
                          // Process data.
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            AppColors.MAINTEXTWHITE),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.FOURTH_COLOR),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Back'),
                    ),
                  ),
                ],
              ),
            )));
  }
}

class AddBoatStatus extends StatelessWidget {
  final String status;
  final DateTime datetime;
  final String reason;
  final String note;

  AddBoatStatus(this.datetime, this.status, this.reason, this.note);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference boatStatus =
        FirebaseFirestore.instance.collection('flanders');

    Future<void> addBoatStatus() {
      // Call the user's CollectionReference to add a new user
      return boatStatus
          .add({
            'datetime': datetime,
            'status': status,
            'reason': reason,
            'note': note
          })
          .then((value) => PlatformAlertDialog(
                title: Text('AlertDialog Title'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[Text('Status Updated')],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ))
          .catchError((error) => PlatformAlertDialog(
                title: Text('AlertDialog Title'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[Text('Error Updating!')],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
    }

    return TextButton(
      onPressed: addBoatStatus,
      child: Text(
        "Update Flanders",
      ),
    );
  }
}
