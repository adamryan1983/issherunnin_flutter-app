import 'package:flutter/material.dart';
import 'tabs.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import './controllers/authBinding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(AppExtended());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: GetMaterialApp(
        initialBinding: AuthBinder(),
        title: "Is She Runnin'?",
        theme: ThemeData(
            fontFamily: 'Montserrat',
            backgroundColor: AppColors.PRIMARY_COLOR,
            primaryColor: AppColors.PRIMARY_COLOR,
            primaryColorLight: AppColors.MAINTEXTBLACK,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: AppColors.MAINBGWHITE),
        home: TabsPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class AppExtended extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return App();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Container(child: Text("Ruh roh.")));
  }
}

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/images/splash.png',
                fit: BoxFit.cover, width: 250),
            Container(
              width: 220,
              padding: EdgeInsets.all(4.0),
              child: Text("Loading",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            ),
          ]),
    );
  }
}
