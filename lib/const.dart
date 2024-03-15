
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

String ip = "172.23.20.44";
String token = '';
String signUpUrl = "http://$ip:3000/v1/signup";
String signInUrl = "http://$ip:3000/v1/login";
String sendCodeUrl = "http://$ip:3000/v1/sendCode";
String loginTelegramUrl = "http://$ip:3000/v1/loginTelegram";
String uploadFile = "http://$ip:3000/v1/upload-file";

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

Future<void> sendFileToTelegram() async {
  late List<String?> filePaths=[];
  List<MultipartFile> multiFiles=[];
  FilePickerResult? file = await FilePicker.platform.pickFiles(allowMultiple: true);
  if(file != null){filePaths = file.paths;}
  for(int i=0; i<filePaths.length; i++){
    MultipartFile f= await MultipartFile.fromFile(filePaths[i]!);
    multiFiles.add(f);
  }
  final formData = FormData.fromMap({
    'token': token,
    'files': multiFiles
  });
  var response = await Dio().post(
      uploadFile,
      data: formData
  );
}