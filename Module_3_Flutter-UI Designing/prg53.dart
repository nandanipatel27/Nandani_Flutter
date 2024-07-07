import 'package:flutter/material.dart';

class Prg53 extends StatefulWidget {
  const Prg53({super.key});

  @override
  State<Prg53> createState() => _Prg53State();
}

class _Prg53State extends State<Prg53> {
  Color bgcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        title: Text("Background color"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                bgcolor=Colors.red;
              });
            }, child: Text("Red")),
            ElevatedButton(onPressed: (){
              setState(() {
                bgcolor=Colors.blue;
              });
            }, child: Text("Blue")),
            ElevatedButton(onPressed: (){
              setState(() {
                bgcolor=Colors.green;
              });
            }, child: Text("Green")),
          ],
        ),
      ),
    );
  }
}
