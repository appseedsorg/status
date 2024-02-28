import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text(
          "Success",
          style: TextStyle(
            color: Colors.green,
            fontSize: 24.0, // Adjust font size as needed
          ),
        ),
      ),
    );
  }
}
