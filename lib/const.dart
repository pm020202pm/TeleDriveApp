
import 'package:dio/dio.dart';

String token = '';
String signUpUrl = "http://172.23.18.226:3000/v1/signup";
String signInUrl = "http://172.23.18.226:3000/v1/login";
String sendCodeUrl = "http://172.23.18.226:3000/v1/sendCode";
String loginTelegramUrl = "http://172.23.18.226:3000/v1/loginTelegram";
String uploadFile = "http://172.23.18.226:3000/v1/upload-file";

Future<void> signUp(String phoneNo, String password) async {
  final dio = Dio();
  var res= await dio.post(
      signUpUrl,
      data: {
        'phoneNo': phoneNo,
        'password': password
      }
  );
  print(res.data);
}

Future<String> signIn(String phoneNo, String password) async {
  final dio = Dio();
  var res= await dio.post(
      signInUrl,
      data: {
        'phoneNo': phoneNo,
        'password': password
      }
  );
  return res.data["token"];
}

Future<String> sendCode(String token) async {
  final dio = Dio();
  var res= await dio.post(
      sendCodeUrl,
      data: {
        'token': token
      }
  );
  return res.data["phoneCodeHash"];
}