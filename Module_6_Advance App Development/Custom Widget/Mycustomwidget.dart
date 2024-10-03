// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController? controller;
  String? label;
  String? hinttext;

  MyTextField({
    required this.controller,
    required this.hinttext,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: label == "Password" ? true : false,
        controller: controller,
        style: TextStyle(color: Colors.teal),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.teal),
          border: OutlineInputBorder(),
          hintText: hinttext,
        ),
      ),
    );
  }
}
