import 'package:flutter/material.dart';

class LargeImageScreen extends StatelessWidget {
  final String imageUrl;

  LargeImageScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          imageUrl,
          fit: BoxFit.contain, // Adjust the BoxFit as needed
        ),
      ),
    );
  }
}
