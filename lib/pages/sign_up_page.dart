import 'dart:ui';
import 'package:flutter/material.dart';
import '../const.dart';
import '../tools/commonWidgets/login_button.dart';
import '../tools/commonWidgets/text_field.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading =false;
  TextEditingController number = TextEditingController();
  TextEditingController psswrd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width   > MediaQuery.of(context).size.height
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width  < MediaQuery.of(context).size.height
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor:  Colors.white,
        body: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: height * 0.5,
              width: width * 0.8,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/grids/noise.jpg',
                    ),
                    fit: BoxFit.cover,
                    opacity: 0.05),
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 226, 226, 226).withOpacity(0.45),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30, top: 15),
                    child: Text("Hello!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),),),
                  TextField1(controller: number, hintText: "Enter Phone Number"),
                  TextField1(controller: psswrd, hintText: "Enter Password", obscureText: true),
                  (isLoading)
                      ? CircularProgressIndicator(color: Colors.grey.shade600,)
                      : LoginButton(
                      buttonText: "Sign Up",
                      onTap: () async {
                        isLoading =true;
                        setState(() {});
                        await signUp(number.text, psswrd.text).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage())));
                        isLoading =false;
                        setState(() {});
                      }
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already registered?", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextButton(
                        style: TextButton.styleFrom(foregroundColor: Colors.blue),
                        onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));},
                        child: const Text("Log In"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
