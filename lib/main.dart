import 'package:fitness_app/pages/on_boarding_page.dart';
import 'package:fitness_app/shared/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: mainColor),
      ),
    );
  }
}
