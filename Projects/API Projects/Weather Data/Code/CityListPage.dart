import 'package:flutter/material.dart';
import 'package:weather_app/CityWeatherDetailsPage.dart';


class CityListPage extends StatelessWidget {
  final String country;

  CityListPage({required this.country});

  final Map<String, List<String>> citiesByCountry = {
    'USA': ['New York', 'Los Angeles', 'Chicago'],
    'India': ['Delhi', 'Mumbai', 'Bangalore'],
    'Australia': ['Sydney', 'Melbourne', 'Perth'],
    'Canada' : ['Toronto']
  };

  @override
  Widget build(BuildContext context) {
    final cities = citiesByCountry[country] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Cities in $country',
            style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF264272),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to Weather Details Page with the selected city
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WeatherDetailsPage(city: cities[index]),
                  ),
                );
              },
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.lightBlue[50],
                child: ListTile(
                  title: Text(
                    cities[index],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: Colors.blueAccent),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
