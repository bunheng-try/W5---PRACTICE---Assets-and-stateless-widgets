import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            WeatherCard(
              city: 'Phnom Penh',
              minTemp: 10,
              maxTemp: 40,
              currentTemp: 12.2,
              color1: Colors.purple,
              color2: Colors.blue,
              imagePath: '../assets/ex4/cloudy.png',
            ),
            WeatherCard(
              city: 'Paris',
              minTemp: 10,
              maxTemp: 40,
              currentTemp: 22.2,
              color1: Colors.green,
              color2: Colors.teal,
              imagePath: '../assets/ex4/sunnyCloudy.png',
            ),
            WeatherCard(
              city: 'Rome',
              minTemp: 10,
              maxTemp: 40,
              currentTemp: 45.2,
              color1: Colors.orange,
              color2: Colors.red,
              imagePath: '../assets/ex4/sunny.png',
            ),
            WeatherCard(
              city: 'Toulouse',
              minTemp: 10,
              maxTemp: 40,
              currentTemp: 45.2,
              color1: Colors.orangeAccent,
              color2: Colors.deepOrange,
              imagePath: '../assets/ex4/veryCloudy.png',
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String city;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final Color color1;
  final Color color2;
  final String imagePath;

  const WeatherCard({
    super.key,
    required this.city,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.color1,
    required this.color2,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 6,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white.withValues(alpha: 0.3),
                  backgroundImage: AssetImage(imagePath),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      city,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Min: ${minTemp.toStringAsFixed(1)}°C\nMax: ${maxTemp.toStringAsFixed(1)}°C',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '${currentTemp.toStringAsFixed(1)}°C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
