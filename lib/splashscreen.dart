import 'dart:async';

import 'package:easybillingnewapp1/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  //SplashScreen({Key? key}) : super(key: key);

  //final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState(){

    new Timer(const Duration(milliseconds: 10000), () async {
      final prefs = await SharedPreferences.getInstance();
      String? id = prefs.getString('id');
      setState(() {

        Navigator.of(context).pushAndRemoveUntil(

            MaterialPageRoute(builder: (context) => MyLogin()), (route) => false);
      });
    });

    new Timer(
        Duration(milliseconds: 30),(){
      setState(() {
        _isVisible = true; // Now it is showing fade effect and navigating to Login page
      });
    }
    );

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Theme.of(context).scaffoldBackgroundColor, Theme.of(context).primaryColorDark],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.mirror,
        ),
      ),

      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 140.0,
            width: 140.0,
            child: Center(
              child:Image.network('https://www.geeksforgeeks.org/wp-content/uploads/gfg_200X200.png',
                height: 140.0,
                width: 140.0,
fit:BoxFit.cover,
              ),

            ),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2.0,
                    offset: Offset(5.0, 3.0),
                    spreadRadius: 2.0,
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}