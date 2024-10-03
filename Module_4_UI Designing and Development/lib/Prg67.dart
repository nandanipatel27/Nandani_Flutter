//Write a code to display profile and logout option in options menu.

import 'package:flutter/material.dart';
import 'package:module4/Profile.dart';

class PopupMenu extends StatefulWidget {
  const PopupMenu({super.key});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popup Menu"),
        backgroundColor: Colors.amber,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.menu),
            onSelected: (value) {
              if (value == 'Profile') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ));
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      Text("Profile"),
                    ],
                  ),
                  value: "Profile",
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      Text("Logout"),
                    ],
                  ),
                  value: "Logout",
                ),
               
          // IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
        ];
            }
      ),
        ]
      ),
      body: Center(
        child: Text("Hello, this is the example of popupmenu"),
      ),
    );
  }
}
