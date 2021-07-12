import 'package:flutter/material.dart';
import 'package:quiz_app/helper/authenticate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;

  @override
  void initState() {
    // getLoggedInState();
    super.initState();
  }

  // getLoggedInState() async {
  //   await Constants.getUerLoggedInSharedPreference().then((value) {
  //     setState(() {
  //       isUserLoggedIn = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: isUserLoggedIn ? Home() : Authenticate(),
      home: Authenticate(),
    );
  }
}
