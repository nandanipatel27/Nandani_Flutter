// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:fitness_app/Faceyoga.dart';
// import 'package:fitness_app/GymWorkout.dart';
// import 'package:fitness_app/HomeWorkout.dart';
// import 'package:fitness_app/Stretching.dart';
// import 'package:flutter/material.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //  backgroundColor: Colors.purple.shade50,
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             )),
//         title: Text(
//           "Workouts",
//           style: TextStyle(
//               fontSize: 18, fontFamily: 'Montserrat', color: Colors.white),
//         ),
//         backgroundColor: Colors.purple,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             introCard(),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Text(
//                   "Category",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       fontFamily: 'Montserrat'),
//                 ),
//                 //Text("____________________________________")
//               ],
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => HomeWorkout(),
//                         ));
//                   },
//                   child: Container(
//                     child: categoryCard(
//                         imagepath: 'assets/images/home.png',
//                         txt: "Home Workout"),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => GymWorkout(),
//                         ));
//                   },
//                   child: Container(
//                     child: categoryCard(
//                         imagepath: 'assets/images/gym.png', txt: "Gym Workout"),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => Faceyoga(),
//                         ));
//                   },
//                   child: Container(
//                     child: categoryCard(
//                         imagepath: 'assets/images/Faceyoga.png',
//                         txt: "Face yoga"),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => Stretching(),
//                         ));
//                   },
//                   child: Container(
//                     child: categoryCard(
//                         imagepath: 'assets/images/stretching.png',
//                         txt: "Stretching"),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       // endDrawer: Drawer(
//       //   backgroundColor: Colors.white,
//       //   child: ListView(
//       //     padding: EdgeInsets.zero,
//       //     children: [
//       //       DrawerHeader(
//       //         decoration: BoxDecoration(
//       //           color: Colors.purple,
//       //           image: DecorationImage(
//       //             image: AssetImage("assets/images/dr.png"),
//       //             fit: BoxFit.cover,
//       //           ),
//       //         ),
//       //         child: Text(
//       //           "Hello World",
//       //           style: TextStyle(
//       //             color: Colors.white,
//       //             fontSize: 24,
//       //           ),
//       //         ),
//       //       ),
//       //       ListTile(
//       //         leading: Icon(Icons.home),
//       //         title: Text("HomePage"),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //           Navigator.push(
//       //               context,
//       //               MaterialPageRoute(
//       //                 builder: (context) => Homepage(),
//       //               ));
//       //         },
//       //       ),
//       //       ListTile(
//       //         leading: Icon(Icons.home),
//       //         title: Text("Benefits of Yoga"),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //         },
//       //       ),
//       //       ListTile(
//       //         leading: Icon(Icons.home),
//       //         title: Text("History of Yoga"),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //         },
//       //       ),
//       //       ListTile(
//       //         leading: Icon(Icons.home),
//       //         title: Text("Healthy Meals"),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //         },
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }

//   introCard() {
//     return Stack(
//       children: [
//         Container(
//           margin: EdgeInsets.only(top: 30, left: 20, right: 20),
//           height: MediaQuery.of(context).size.height / 5,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [BoxShadow(color: Colors.deepPurple, blurRadius: 15)],
//               color: Colors.purple.shade300,
//               border: Border.all(color: Colors.black)),
//           child: Container(
//             // color: Colors.amber,
//             margin: EdgeInsets.only(right: 5, top: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   "Build Your Body ",
//                   style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Montserrat'),
//                 ),
//                 Text(
//                   "With Us",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'Montserrat',
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(right: 150),
//           // color: Colors.purple.shade100,
//           //  height: 00,
//           width: 250,
//           child: Image.asset(
//             "assets/images/yogagirl.png",
//             scale: 2,
//           ),
//         ),
//       ],
//     );
//   }

//   categoryCard({required String imagepath, required String txt}) {
//     return Container(
//       color: Colors.white,
//       height: 210,
//       width: 160,
//       child: Card(
//           color: Colors.white,
//           elevation: 10,
//           shadowColor: Colors.purple,
//           shape: RoundedRectangleBorder(
//             side: BorderSide(color: Colors.purple, width: 2.0),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Column(mainAxisSize: MainAxisSize.min, children: [
//             Image.asset(
//               imagepath,
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 txt,
//                 style: TextStyle(fontSize: 12, fontFamily: 'Montserrat'),
//               ),
//             )
//           ])),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:fitness_app/Faceyoga.dart';
import 'package:fitness_app/GymWorkout.dart';
import 'package:fitness_app/HomeWorkout.dart';
import 'package:fitness_app/Stretching.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isDarkTheme = false; // Track the current theme

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Workouts",
            style: TextStyle(
                fontSize: 18, fontFamily: 'Montserrat', color: Colors.white),
          ),
          backgroundColor: Colors.purple,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(isDarkTheme ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  isDarkTheme = !isDarkTheme;
                });
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              introCard(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Montserrat'),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeWorkout(),
                          ));
                    },
                    child: Container(
                      child: categoryCard(
                          imagepath: 'assets/images/home.png',
                          txt: "Home Workout"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GymWorkout(),
                          ));
                    },
                    child: Container(
                      child: categoryCard(
                          imagepath: 'assets/images/gym.png',
                          txt: "Gym Workout"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Faceyoga(),
                          ));
                    },
                    child: Container(
                      child: categoryCard(
                          imagepath: 'assets/images/Faceyoga.png',
                          txt: "Face yoga"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Stretching(),
                          ));
                    },
                    child: Container(
                      child: categoryCard(
                          imagepath: 'assets/images/stretching.png',
                          txt: "Stretching"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  introCard() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.deepPurple, blurRadius: 15)],
              color: Colors.purple.shade300,
              border: Border.all(color: Colors.black)),
          child: Container(
            margin: EdgeInsets.only(right: 5, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Build Your Body ",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                Text(
                  "With Us",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 150),
          width: 250,
          child: Image.asset(
            "assets/images/yogagirl.png",
            scale: 2,
          ),
        ),
      ],
    );
  }

  categoryCard({required String imagepath, required String txt}) {
    return Container(
      color: Colors.white,
      height: 210,
      width: 160,
      child: Card(
          color: Colors.white,
          elevation: 10,
          shadowColor: Colors.purple,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.purple, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Image.asset(
              imagepath,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                txt,
                style: TextStyle(fontSize: 12, fontFamily: 'Montserrat'),
              ),
            )
          ])),
    );
  }
}
