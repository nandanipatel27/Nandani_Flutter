import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskPage2 extends StatelessWidget {
  Future<List<Map<String, dynamic>>> fetchData() async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    String? jsonString = localstorage.getString('records');
    if (jsonString != null) {
      List<Map<String, dynamic>> records =
          List<Map<String, dynamic>>.from(jsonDecode(jsonString));
      return records;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Records'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final records = snapshot.data ?? [];

          if (records.isEmpty) {
            return Center(child: Text('No data found'));
          }

          return ListView.builder(
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              return Container(
                height: 80,
                width: MediaQuery.of(context).size.width - 10,
                child: Card(
                  color: Colors.purple.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          record["email"],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.mail, color: Colors.white),
                              onPressed: () {
                                _showEmailDialog(context, record["email"]);
                              },
                            ),
                            IconButton(
                              icon: Text("View", style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                _showDetailsBottomSheet(context, record);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }


  void _showEmailDialog(BuildContext context, String email) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.purple.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            "Email",
            style: TextStyle(fontSize: 20, color: Colors.deepPurple),
          ),
          content: Text(email, style: TextStyle(fontSize: 16)),
          actions: <Widget>[
            ElevatedButton(
              child: Text("OK",style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, 
              ),
            ),
          ],
        );
      },
    );
  }


  void _showDetailsBottomSheet(BuildContext context, Map<String, dynamic> record) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User Details",
                style: TextStyle(fontSize: 20, color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Name: ${record["name"] }', style: TextStyle(fontSize: 16)),
              Text('Email: ${record["email"] }', style: TextStyle(fontSize: 16)),
              Text('Phone: ${record["phone"] }', style: TextStyle(fontSize: 16)),
              Text('Age: ${record["age"]  }', style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Close",style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.of(context).pop(); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
