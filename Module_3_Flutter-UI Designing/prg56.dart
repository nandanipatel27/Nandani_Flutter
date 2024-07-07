import 'package:flutter/material.dart';

class Prg56 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images Around Text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Image.asset(
              'assets/images/1.jpg',
              width: 100,
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Image.asset(
                  'assets/images/2.jpg',
                  width: 100,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nandani Patel',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                Image.asset(
                  'assets/images/3.jpg',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            Image.asset(
              'assets/images/4.jpg',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
