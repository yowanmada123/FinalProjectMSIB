import 'dart:convert'; 
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:resto_mobile/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final service = ApiService();
  RxString email = ''.obs;
  RxString password = ''.obs;

  Future<void> loginbyEmail() async {
    try {
      final url = Uri.parse(service.BASE_URL);
      Map<String, String> requestBody = <String, String>{'email': email.value, 'password': password.value};
      var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
      var response = await request.send();
      if (response.statusCode >= 200 && response.statusCode < 400) {
        print('Connection OK');
        final respStr = await response.stream.bytesToString();

        var body = jsonDecode(respStr);
        print(body);
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // await pref.setString("login", body['data']['access_token']);
        // await pref.setString("pass", passwordController.text);

        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => BottomNavigation(),
        // ));
        // await pref.setString("password", passwordController.text);
      } else {
        print('Connection Failed');
        // print("Email atau password tidak tepat");
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email atau password Kurang tepat")));
      }
    } catch (error) {
      print(error);
    }
  }
}
