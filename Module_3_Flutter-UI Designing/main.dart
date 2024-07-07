import 'package:assignment3/prg50.dart';
import 'package:assignment3/prg51_52.dart';
import 'package:assignment3/prg54.dart';
import 'package:assignment3/prg55.dart';
import 'package:assignment3/prg56.dart';
import 'package:assignment3/prg57.dart';
import 'package:assignment3/prg59_Signup.dart';
import 'package:assignment3/prg60.dart';
import 'package:flutter/material.dart';
import 'Prg60_1.dart';
import 'Screen1_prg49.dart';
import 'Screen2_prg49.dart';
import 'prg53.dart';
import 'prg59.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Prg60(),
    );
  }
}
