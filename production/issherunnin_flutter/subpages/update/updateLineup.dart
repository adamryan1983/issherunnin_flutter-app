import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateLineup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.7,
        child: LineupStatusWidget()
        // child: Text(
        //   "Update Flanders",
        //   style: TextStyle(
        //     color: AppColors.MAINTEXTBLACK,
        //     fontFamily: 'Poppins',
        //     fontSize: 22.0,
        //   ),
        // ),
        );
  }
}

/// This is the stateful widget that the main application instantiates.
class LineupStatusWidget extends StatefulWidget {
  const LineupStatusWidget({Key key}) : super(key: key);

  @override
  _LineupUpdateStatus createState() => _LineupUpdateStatus();
}

/// This is the private State class that goes with MyStatefulWidget.
class _LineupUpdateStatus extends State<LineupStatusWidget> {
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
                            child: Text("Update Lineup' Status",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600)))),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter the # of cars: ',
                        ),
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a number';
                          }
                          return null;
                        },
                      )),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Choose a side: ',
                        ),
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please choose an option';
                          }
                          return null;
                        },
                      )),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'What is the location of lineup? ',
                        ),
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a location';
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
                ],
              ),
            )));
  }
}

class AddLineupStatus extends StatelessWidget {
  final String cars;
  final DateTime datetime;
  final String side;
  final String location;

  AddLineupStatus(this.datetime, this.cars, this.side, this.location);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference lineupStatus =
        FirebaseFirestore.instance.collection('lineup');

    Future<void> addLineupStatus() {
      // Call the user's CollectionReference to add a new user
      return lineupStatus
          .add({
            'datetime': datetime,
            'cars': cars,
            'side': side,
            'location': location
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
      onPressed: addLineupStatus,
      child: Text(
        "Update Lineup",
      ),
    );
  }
}
