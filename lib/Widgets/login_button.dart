import 'package:flutter/material.dart';
class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.buttonText, required this.onTap});
  final String buttonText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0, top: 10, left: 25, right: 25),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(buttonText, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
              )),
        ),
      ),
    );
  }
}
