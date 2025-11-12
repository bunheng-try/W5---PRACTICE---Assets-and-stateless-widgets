import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum ProductType { dart, flutter, firebase }

class ProductCard extends StatelessWidget {
  final ProductType product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String imagePath = '';
    String title = '';
    String description = '';

    switch (product) {
      case ProductType.dart:
        imagePath = '../assets/ex3/dart.png';
        title = 'Dart';
        description = 'the best object language';
        break;
      case ProductType.flutter:
        imagePath = '../assets/ex3/flutter.png';
        title = 'Flutter';
        description = 'the best mobile widget library';
        break;
      case ProductType.firebase:
        imagePath = '../assets/ex3/firebase.png';
        title = 'Firebase';
        description = 'the best cloud database';
        break;
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        backgroundColor: Colors.grey[200],
        body: ListView(
          children: const [
            ProductCard(product: ProductType.dart),
            ProductCard(product: ProductType.flutter),
            ProductCard(product: ProductType.firebase),
          ],
        ),
      ),
    );
  }
}
