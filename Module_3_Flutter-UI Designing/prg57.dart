import 'package:flutter/material.dart';

class Prg57 extends StatefulWidget {
  const Prg57({super.key});

  @override
  State<Prg57> createState() => _Prg57State();
}

class _Prg57State extends State<Prg57> {
  Color bgcolor = Colors.white;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        title: Text("Radio Button Example"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile(
              title: Text("Red"),
              value: Colors.red,
              groupValue: bgcolor,
              onChanged: (Color? value) {
                setState(() {
                  bgcolor = value!;
                });
              }),
          RadioListTile(
              title: Text("Blue"),
              value: Colors.blue,
              groupValue: bgcolor,
              onChanged: (Color? value) {
                setState(() {
                  bgcolor = value!;
                });
              }),
          RadioListTile(
              title: Text("Green"),
              value: Colors.green,
              groupValue: bgcolor,
              onChanged: (Color? value) {
                setState(() {
                  bgcolor = value!;
                });
              }),

        ],
      ),
    );
  }
}
