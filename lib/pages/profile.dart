import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "This is a profile page",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}