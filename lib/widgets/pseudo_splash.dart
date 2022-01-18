import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import '../Firebase/GoogleSignInPage.dart';
import '../Firebase/SignInCheck.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/FirstPage.dart';


class Psplash extends StatefulWidget {
  @override
  _PsplashState createState() => _PsplashState();
}

class _PsplashState extends State<Psplash> with AfterLayoutMixin<Psplash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignInCheck()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => FirstPage()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
    );
  }
}