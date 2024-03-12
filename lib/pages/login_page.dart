import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tele_drive_app/pages/sign_up_page.dart';
import '../Widgets/login_button.dart';
import '../Widgets/text_field.dart';
import '../const.dart';
import '../tools/navigationbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading =false;
  final dio = Dio();
  TextEditingController number = TextEditingController();
  TextEditingController psswrd = TextEditingController();
  // String token='';
  String phoneCodeHash ='';


  Future<void> signMeIn(String phoneNo, String password) async {
    isLoading=true;
    setState(() {});
    token = await signIn(phoneNo, password);
    phoneCodeHash = await sendCode(token);
    setState(() {});
    isLoading=false;
    setState(() {});
  }


  Future<void> loginTelegram(String token, String phoneCodeHash, String phoneCode) async {
    isLoading=true;
    setState(() {});
    var res= await dio.post(
        loginTelegramUrl,
        data: {
          'token': token,
          'phoneCodeHash' : phoneCodeHash,
          'phoneCode' : phoneCode
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: height * 0.5,
              width: width * 0.8,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/images/grids/noise.jpg',),
                    fit: BoxFit.cover,
                    opacity: 0.05),
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300]?.withOpacity(0.45),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30, top: 15),
                    child: Text("Hello Again!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),),),
                  TextField1(controller: number, hintText: (phoneCodeHash=='')? "Enter Phone Number": "Enter OTP"),
                  if(phoneCodeHash=='') TextField1(controller: psswrd, hintText: "Enter Password", obscureText: true),
                  isLoading
                      ? CircularProgressIndicator(color: Colors.grey.shade600,)
                      : LoginButton(
                    buttonText: (phoneCodeHash=='')? "Send OTP": "Submit OTP",
                    onTap: () async {
                      (phoneCodeHash=='')
                          ? signMeIn(number.text, psswrd.text)
                          : loginTelegram(token, phoneCodeHash, number.text).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MyHomePage())));
                      isLoading=false;
                      number.clear();
                      psswrd.clear();
                    }
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Does not have an account?", style: TextStyle(fontWeight: FontWeight.bold),),
                      TextButton(
                        style: TextButton.styleFrom(foregroundColor: Colors.blue),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()),);
                        },
                        child: const Text("Sign Up"),
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

