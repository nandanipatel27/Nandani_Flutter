import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/ProfileScreen.dart';
import 'package:flutter_firebase/SignIn.dart';
import 'package:flutter_firebase/messageScreen.dart';

class Dashboard extends StatefulWidget {
  User? user;

  Dashboard({this.user});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? username = "";
  TextEditingController _searchController = TextEditingController();

  List<DocumentSnapshot>? allUsers;
  List<DocumentSnapshot>? filteredUsers;

  Future<void> getUserRecord() async {
    var document = await FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.user!.uid)
        .get();

    setState(() {
      username = document["name"];
    });
  }

  @override
  void initState() {
    super.initState();
    getUserRecord();
  }

  void searchUser(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        filteredUsers = allUsers;
      } else {
        filteredUsers = allUsers!
            .where((user) =>
                user["name"].toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Welcome ${username}",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.teal),
        backgroundColor: Colors.teal,
        elevation: 20,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (String value) {
              if (value == "Profile") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        user: widget.user,
                      ),
                    ));
              } else if (value == "Logout") {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ));
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'Profile',
                  child: Text(
                    'Profile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                PopupMenuItem(
                  value: 'Logout',
                  child: Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ];
            },
            color: Colors.teal,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    searchUser(value);
                  },
                  style: TextStyle(color: Colors.teal),
                  decoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Enter search keywords',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  )),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  allUsers = snapshot.data!.docs
                      .where((element) => element.id != widget.user!.uid)
                      .toList();

                  filteredUsers ??=
                      List.from(allUsers!); // initially show all users

                  return ListView.builder(
                    itemCount: filteredUsers!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Messagescreen(
                                      userSnapshot: filteredUsers![index]),
                                ));
                          },
                          child: Card(
                            color: const Color.fromARGB(255, 101, 181, 173),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.network(
                                        "${filteredUsers![index]["profilePic"]}"),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "${filteredUsers![index]["name"]}",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }
}
