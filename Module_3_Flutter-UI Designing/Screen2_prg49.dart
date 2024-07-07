import 'package:flutter/material.dart';

class Screen2_prg49 extends StatefulWidget {
  const Screen2_prg49({super.key});

  @override
  State<Screen2_prg49> createState() => _Screen2_prg49State();
}

class _Screen2_prg49State extends State<Screen2_prg49> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: screenHeight / 4,
              width: screenWidth,
              child: Image.asset(
                "assets/images/nature.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lake View & mountain",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      Text(
                        "Switzerland",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 30,
                      ),
                      Text("41",style: TextStyle(fontSize: 24),)
                    ],
                  ),
        
                ],
              ),
            ),
             Container(
               margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
               child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.call,
                          color: Colors.blue,
                        size: 30,
                      ),
                      Text("Call",style: TextStyle(
                        color: Colors.blue
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.send,
                          color: Colors.blue,
                        size: 30,
                      ),
                      Text("Route",style: TextStyle(
                        color: Colors.blue
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.share,
                          color: Colors.blue,size: 30,
                      ),
                      Text("Share",style: TextStyle(
                        color: Colors.blue
                      ),)
                    ],
                  ),
                ],
                         ),
             ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Text("They are formed when glaciers dug out a basin, which was later filled with snow melt. These lakes can form directly at the head of retreating glaciers, buffered by big piles of rock debris that the glacier has carried down, called terminal moraines, which signal the glacier has gone as far as it can go",style: TextStyle(fontSize: 20),))
          ],
        ),
      ),
    );
  }
}
