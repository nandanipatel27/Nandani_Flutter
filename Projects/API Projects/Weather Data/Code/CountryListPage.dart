import 'package:flutter/material.dart';
import 'package:weather_app/CityListPage.dart';


class CountryListPage extends StatelessWidget {
  final List<String> countries = ['USA', 'India', 'Australia','Canada'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Country', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF264272),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Display two columns
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: countries.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to City List Page with the selected country
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CityListPage(country: countries[index]),
                  ),
                );
              },
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.blue.withOpacity(0.9),
                child: Center(
                  child: Text(
                    countries[index],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
