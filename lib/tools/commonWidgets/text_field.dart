import 'package:flutter/material.dart';
class TextField1 extends StatelessWidget {
  const TextField1({super.key, this.hintText, required this.controller, this.obscureText, required this.textInputType});
  final String? hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: TextField(
            keyboardType: textInputType,
            obscureText: obscureText?? false,
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
