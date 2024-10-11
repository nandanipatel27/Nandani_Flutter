import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:greycell/TaskPage2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskPage1 extends StatefulWidget {
  @override
  _TaskPage1State createState() => _TaskPage1State();
}

class _TaskPage1State extends State<TaskPage1> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String? _name;
  String? _email;
  int? _phone;
  int? _age;

  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _users = [];

  Future<void> saveRecords() async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(_users);
    await localstorage.setString('records', jsonString);

    print(
        "---------------->>>> GET SHARE ${localstorage.getString('records')}");

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskPage2(),
        ));
  }

  bool isValidRecord(String name, String email, String phone, int age) {
    if (age < 18 || age > 25) return false;
    for (var record in _users) {
      if (record['email'] == email) return false;
      if (record['phone'] == phone) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Form',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple.shade300,
        elevation: 4.0,
        shadowColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Enter Your Details",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple.shade500,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _name = newValue!;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _email = newValue!;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _phone = int.parse(newValue!);
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  int? age = int.tryParse(value);
                  if (age == null || age < 18 || age > 25) {
                    return 'Age must be between 18 and 25';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _age = int.parse(newValue!);
                },
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      if (isValidRecord(
                          _name!, _email!, _phone!.toString(), _age!)) {
                        _users.add({
                          'name': _name,
                          'email': _email,
                          'phone': _phone,
                          'age': _age,
                        });
                        saveRecords();
                        _nameController.clear();
                        _emailController.clear();
                        _phoneController.clear();
                        _ageController.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Record is invalid or already exists.')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade500,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
