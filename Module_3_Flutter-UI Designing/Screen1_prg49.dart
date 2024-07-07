import 'package:flutter/material.dart';

class Screen1_prg49 extends StatefulWidget {

  const Screen1_prg49({super.key});

  @override
  State<Screen1_prg49> createState() => _Screen1_prg49State();
}

class _Screen1_prg49State extends State<Screen1_prg49> {

  double screenHeight  = 0.0;
  double screenWidth  = 0.0;


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
        
                height: 200,
                width: screenWidth,
                margin: EdgeInsets.only(bottom: 10),
                color: Colors.red,
              ),
              Row(
                children: [
                  Container(
                    height: 200,
                    width: screenWidth/2 - 25,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 200,
                    width: screenWidth/2-25,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    height: 200,
                    width: screenWidth/2 - 25,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 200,
                    width: screenWidth/2-25,
                    color: Colors.blue,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: screenWidth/4,
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    color: Colors.amber,
                  ),
                  Container(
                    height: 100,
                    width: screenWidth/4,
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    color: Colors.amber,
                  ),
                  Container(
                    height: 100,
                    width: screenWidth/4,
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    color: Colors.amber,
                  ),
        
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: screenWidth/4,
                    margin: EdgeInsets.only(bottom: 10),
                    color: Colors.amber,
                  ),
                  Container(
                    height: 100,
                    width: screenWidth/4,
                    margin: EdgeInsets.only(bottom: 10),
                    color: Colors.amber,
                  ),
                  Container(
                    height: 100,
                    width: screenWidth/4,
                    margin: EdgeInsets.only(bottom: 10),
                    color: Colors.amber,
                  ),
        
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
