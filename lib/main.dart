import 'package:easybillingnewapp1/register.dart';
import 'package:easybillingnewapp1/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool shouldNavigateToRegister = prefs.getBool('shouldNavigateToRegister') ?? false;

  await Hive.initFlutter();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: shouldNavigateToRegister ? MyRegister() : SplashScreen(),
    routes: {
      'register': (context) {
        prefs.setBool('shouldNavigateToRegister', true);
        return MyRegister();
      },
      'splash': (context) => SplashScreen(),
    },
  ));
}