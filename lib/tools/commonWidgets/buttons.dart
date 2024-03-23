import 'package:flutter/material.dart';
class Button1 extends StatelessWidget {
  const Button1({super.key, required this.buttonText, required this.onTap, required this.color});
  final String buttonText;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(

              color: color,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(buttonText, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
              )),
        ),
      ),
    );
  }
}
