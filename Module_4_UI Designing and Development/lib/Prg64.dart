//Write a code to display alert dialog with list of cities and Single choice selection display selected city in TextView.
// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Prg64 extends StatefulWidget {
  const Prg64({super.key});

  @override
  State<Prg64> createState() => _Prg64State();
}

class _Prg64State extends State<Prg64> {
  List<String> cities = ["India", "Los Angeles", "Chicago", "Houston", "Phoenix"];
  String? selectedCity;

  void _showCityDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a city'),
          content: SingleChildScrollView(
            child: Column(
              children: cities.map((city) {
                return RadioListTile<String>(
                  title: Text(city),
                  value: city,
                  groupValue: selectedCity,
                  onChanged: (String? value) {
                    setState(() {
                      selectedCity = value;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Selector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedCity != null ? 'Selected City: $selectedCity' : 'No City Selected',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showCityDialog,
              child: Text('Select City'),
            ),
          ],
        ),
      ),
    );
  }
}

