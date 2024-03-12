import 'package:flutter/material.dart';

class recent extends StatelessWidget {
  const recent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "This is a recents' page",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
