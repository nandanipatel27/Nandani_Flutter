import 'package:flutter/material.dart';

class Prg62 extends StatefulWidget {
  const Prg62({super.key});

  @override
  State<Prg62> createState() => _Prg62State();
}

class _Prg62State extends State<Prg62> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(width: 10),
                      Text('Alert box'),
                    ],
                  ),
                  content: Text('This is an alert message.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Click me'),
        ),
      ),
    );
  }
}

