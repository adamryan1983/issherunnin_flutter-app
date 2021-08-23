import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:issherunnin_flutter/controllers/lineupController.dart';

//ignore: must_be_immutable
class UpdateLineup extends StatefulWidget {
  UpdateLineup({Key key}) : super(key: key);

  @override
  _UpdateLineupState createState() => _UpdateLineupState();
}

class _UpdateLineupState extends State<UpdateLineup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String status, cars, location;
  bool _selected = false;
  List<dynamic> items = [
    'Please select a side',
    'Bell Island',
    'Portugal Cove-St. Philips'
  ];

  @override
  Widget build(BuildContext context) {
    final LineupController controller = Get.put(LineupController());
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text("Update Current Lineup Conditions",
                  style:
                      (TextStyle(fontSize: 22, color: AppColors.FOURTH_COLOR))),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                            child: Text('Select which side:')),
                        Obx(() => DropdownButton(
                              onChanged: (newValue) {
                                controller.setSelectedSide(newValue);
                              },
                              value: _selected
                                  ? controller.selectedSide.value
                                  : controller.selectedSide.value,
                              items: items.map((selectedType) {
                                return DropdownMenuItem(
                                  child: Text(
                                    selectedType,
                                  ),
                                  value: selectedType,
                                );
                              }).toList(),
                            )),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Enter number of vehicles",
                              hintText: "i.e. 25"),
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'(^\d*\.?\d{0,2})'))
                          ],
                          // Only numbers can be entered
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter an amount of cars';
                            }
                          },
                          onSaved: (value) => cars = value,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Approx. Location",
                            hintText: "i.e. Up to ticket booth",
                          ),
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter location';
                            }
                            return null;
                          },
                          onSaved: (value) => location = value,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                          child: Platform.isIOS
                              ? CupertinoButton(
                                  color: AppColors.SECONDARY_COLOR,
                                  child: Text(
                                    "Update Lineup",
                                    style: (TextStyle(fontSize: 18)),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      controller.setLineupStatus(
                                          cars,
                                          controller.selectedSide.value,
                                          location);
                                    }
                                  },
                                )
                              : ElevatedButton(
                                  child: Text(
                                    "Update",
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      controller.setLineupStatus(
                                          cars,
                                          controller.selectedSide.value,
                                          location);
                                    }
                                  },
                                ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
