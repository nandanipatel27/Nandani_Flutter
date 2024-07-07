import 'package:flutter/material.dart';

class Prg55 extends StatefulWidget {
  @override
  _Prg55State createState() => _Prg55State();
}

class _Prg55State extends State<Prg55> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Text Display'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Click On Checkbox",style: TextStyle(fontSize: 28),),
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
              ],
            ),
            if (_isChecked)
              Text(
                'Hello, Flutter!',
                style: TextStyle(fontSize: 24.0),
              ),
          ],
        ),
      ),
    );
  }
}
