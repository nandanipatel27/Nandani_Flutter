import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherDetailsPage extends StatefulWidget {
  final String city;

  WeatherDetailsPage({required this.city});

  @override
  _WeatherDetailsPageState createState() => _WeatherDetailsPageState();
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage> {
  bool isLoading = false;
  Map<String, dynamic> weatherData = {};

  @override
  void initState() {
    super.initState();
    fetchWeatherData(widget.city);
  }

  Future<void> fetchWeatherData(String cityName) async {
    setState(() {
      isLoading = true;
    });

    // Replace with your actual search API endpoint
    var response = await http
        .get(Uri.parse("https://freetestapi.com/api/v1/weathers?search=$cityName"));

    if (response.statusCode == 200) {
      List allWeatherData = jsonDecode(response.body);
      setState(() {
        weatherData = allWeatherData.isNotEmpty ? allWeatherData.first : {};
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // Handle error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in ${widget.city}', style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF264272),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : weatherData.isEmpty
              ? const Center(
                  child: Text(
                    'No weather data available.',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.lightBlueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'City: ${weatherData['city']}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Temperature: ${weatherData['temperature']}°C',
                            style: const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Condition: ${weatherData['condition']}',
                            style: const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Humidity: ${weatherData['humidity']}%',
                            style: const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Wind Speed: ${weatherData['windSpeed']} km/h',
                            style: const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
