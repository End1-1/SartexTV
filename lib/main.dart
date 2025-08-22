import 'dart:io';

import 'package:flutter/material.dart';

import 'package:sartex_tv/screen/ste.dart';
import 'package:sartex_tv/screen/tv/tv_screen.dart';
import 'package:sartex_tv/utils/consts.dart';
import 'package:sartex_tv/utils/prefs.dart';
import 'package:sartex_tv/utils/translator.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'utils/sql.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  try {
    prefs = await SharedPreferences.getInstance();

  try {
    prefs.resetRoles();
  } catch (e) {
    print('prefs.resetRoles() error: $e');
  }

  try {
    await Sql.init();
  } catch (e) {
    print('Sql.init() error: $e');
  }

  try {
    L.language = prefs.getString(key_language) ?? key_language_am;
  } catch (e) {
    print('Language init error: $e');
  }
} catch (e, st) {
print('Unexpected error in main(): $e');
print(st);
}

runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return MaterialApp(

        theme: ThemeData(
            fontFamily: 'Sylfaen',
            textTheme: const TextTheme(
              bodyLarge: TextStyle(fontSize: 12, color: Colors.black),
              bodySmall: TextStyle(fontSize: 12, color: Colors.black),
              bodyMedium: TextStyle(fontSize: 12, color: Colors.black),
            )),
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => TVScreen(false),
          route_tv: (context) =>  TVScreen(false)

        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
