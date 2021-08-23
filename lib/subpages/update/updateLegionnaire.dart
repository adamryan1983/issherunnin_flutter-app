import 'dart:io';

import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:get/get.dart';
import 'package:issherunnin_flutter/controllers/boatController.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class UpdateLegionnaire extends StatefulWidget {
  UpdateLegionnaire({Key key}) : super(key: key);

  @override
  _UpdateLegionnaireState createState() => _UpdateLegionnaireState();
}

class _UpdateLegionnaireState extends State<UpdateLegionnaire> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String status, reason, note;
  bool _selected = false;
  List<dynamic> items = [
    'Please select a status',
    'Running',
    'Delayed',
    'Tied Up(Mechanical)',
    'Tied Up(Weather)'
  ];

  @override
  Widget build(BuildContext context) {
    final BoatController controller = Get.put(BoatController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Update Current Legionnaire Status",
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
                          child: Text('Boat Status')),
                      Obx(() => DropdownButton(
                            onChanged: (newValue) {
                              controller.setSelected(newValue);
                            },
                            value: _selected
                                ? controller.selected.value
                                : controller.selected.value,
                            items: items.map((selectedType) {
                              return DropdownMenuItem(
                                child: new Text(
                                  selectedType,
                                ),
                                value: selectedType,
                              );
                            }).toList(),
                          )),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter reason (if known)",
                          hintText: "i.e. engine trouble",
                        ),
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a reason';
                          }
                        },
                        onSaved: (value) => reason = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Additional Notes",
                          hintText: "i.e. will be repaired in 2hrs",
                        ),
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a small note';
                          }
                        },
                        onSaved: (value) => note = value,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                        child: Platform.isIOS
                            ? CupertinoButton(
                                color: AppColors.SECONDARY_COLOR,
                                child: Text(
                                  "Update Ferry Status",
                                  style: (TextStyle(fontSize: 18)),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    controller.setLegionnaireStatus(
                                        controller.selected.value,
                                        reason,
                                        note);
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
                                    controller.setLegionnaireStatus(
                                        controller.selected.value,
                                        reason,
                                        note);
                                  }
                                },
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Platform.isIOS
                            ? CupertinoButton(
                                child: Text("Button"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            : ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.MAINTEXTWHITE),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.FOURTH_COLOR),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Back'),
                              ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
