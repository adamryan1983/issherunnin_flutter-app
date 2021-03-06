import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
// import 'package:issherunnin_flutter/subpages/update/updateLegionnaire.dart';
import 'package:issherunnin_flutter/subpages/update/updateFlanders.dart';
import 'package:issherunnin_flutter/subpages/update/updateBeaumont.dart';
import '../update.dart';

const String title = 'Update Ferry';

class UpdateBoat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(50),
                height: 200,
                width: 250,
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        AppColors.MAINTEXTWHITE),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.FOURTH_COLOR),
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
                    textAlign: TextAlign.center,
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
                    MaterialPageRoute(builder: (context) => UpdateBeaumont()),
                  );
                },
                child: Text(
                  'Beaumont Hamel',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdatePage()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
