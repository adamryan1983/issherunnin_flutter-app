import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:issherunnin_flutter/subpages/update/updateLegionnaire.dart';
import 'package:issherunnin_flutter/subpages/update/updateFlanders.dart';
import '../update.dart';

const String title = 'Update Ferry';

class UpdateBoat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(50),
            height: 200,
            width: 250,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(AppColors.MAINTEXTWHITE),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.FOURTH_COLOR),
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return AppColors.PRIMARY_COLOR.withOpacity(0.5);
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed))
                      return AppColors.PRIMARY_COLOR.withOpacity(0.5);
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateFlanders()),
                );
              },
              child: Text(
                'Flanders',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            )),
        Container(
            padding: EdgeInsets.all(50),
            height: 200,
            width: 250,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(AppColors.MAINTEXTWHITE),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.FIFTH_COLOR),
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return AppColors.PRIMARY_COLOR.withOpacity(0.5);
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed))
                      return AppColors.PRIMARY_COLOR.withOpacity(0.5);
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateLegionnaire()),
                );
              },
              child: Text(
                'Legionnaire',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            )),
        Container(
          child: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdatePage()),
                );
              }),
        )
      ],
    ));
  }
}
