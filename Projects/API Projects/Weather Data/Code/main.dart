import 'package:flutter/material.dart';
import 'package:weather_app/CountryListPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attractive Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF264272),
      ),
      home: CountryListPage(),
    );
  }
}
