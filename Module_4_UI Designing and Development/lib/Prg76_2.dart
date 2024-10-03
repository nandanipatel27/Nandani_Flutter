import 'package:flutter/material.dart';

class Prg76_2 extends StatelessWidget {
  final double sum;

  Prg76_2({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
      ),
      body: Center(
        child: Text(
          'Sum: $sum',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
