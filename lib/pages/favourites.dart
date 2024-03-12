import 'package:flutter/material.dart';

class favourites extends StatelessWidget {
  const favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "This is a favourites page",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
