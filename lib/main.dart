import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/splash_page.dart';
import 'package:worldtime/pages/show_time.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(),
          '/home': (context) => Home(),
          '/show_time': (context) => ShowTime(),
        },
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.indigo,
          accentColor: Colors.black,
        ),
      ),
    );
