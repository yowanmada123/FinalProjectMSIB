import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/global_controller.dart';
import 'package:resto_mobile/page/home/enable_location.dart';
import 'package:resto_mobile/page/home/home_navbar.dart';
import 'package:resto_mobile/page/login/profile.dart';
import 'package:resto_mobile/page/register/register_page.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../services/api_service.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GlobalController cGlobal;
  late LoginController controller;
  final service = ApiService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  SvgPicture.asset(
                    'assets/images/cake_blueberry.svg',
                    matchTextDirection: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // const Text(
                  //   "Welcome",
                  //   style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  const Text(
                    // alignment: Alignment.center,
                    "You will be delighted with our sweets!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Color(0xff6B5E5E), fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "There is something for everything to taste",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(color: const Color(0xffFFFAFA), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xffCCC9C9))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.email,
                            color: Color(0xffA9A9A9),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(color: const Color(0xffFFFAFA), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xffCCC9C9))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: isShow,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isShow = !isShow;
                              });
                            },
                            child: const Icon(
                              Icons.remove_red_eye,
                              color: Color(0xffA9A9A9),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_passwordController.text.isNotEmpty && _emailController.text.isNotEmpty) {
                      loginbyEmail();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email atau password tidak boleh kosong")));
                    }
                  },
                  child: Container(
                    width: 151,
                    height: 45,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(27), color: OprimaryColor),
                    child: const Center(
                        child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const RegisterPage());
                  },
                  child: Container(
                    width: 151,
                    height: 45,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(27), color: Colors.white, border: Border.all(color: OsecondaryColor)),
                    child: Center(
                        child: Text(
                      "Register",
                      style: TextStyle(color: OsecondaryColor),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> loginbyEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await http.post(
        Uri.parse('https://api1.sib3.nurulfikri.com/api/login'),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"email": _emailController.text, "password": _passwordController.text},
      );
      if (response.statusCode >= 200 && response.statusCode < 400) {
        print('Connection OK');
        print(response.body);
        final respStr = response.body;
        var body = jsonDecode(respStr);
        await prefs.setString('user.name', body['data']['user']['name']);
        await prefs.setString('user.id', body['data']['user']['id'].toString());
        await prefs.setString('user.email', body['data']['user']['email']);
        await prefs.setString('user.handphone', body['data']['user']['handphone']);
        await prefs.setString('user.role', body['data']['user']['role']);
        await prefs.setString('token', body['data']['token']);
        var name = prefs.getString("user.name");
        var email = prefs.getString("user.email");
        print(name);
        print(email);
        // print(body['data']['token']);
        // print(body['data']['user']['name']);
        // Profile user = Profile(name: body['data']['user']['name'], email: body['data']['user']['email'], id: body['data']['user']['id'], handphone: body['data']['user']['handphone']);
        // print(user.email);
        // setState(() {
        // cGlobal.user.value = Profile(name: body['data']['user']['name'], email: body['data']['user']['email'], id: body['data']['user']['id'], handphone: body['data']['user']['handphone']);

        // });
        // print(cGlobal.user);
        // ignore: use_build_context_synchronously
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Berhasil")));
        Get.offAll(const EnableLocationPage());
      } else {
        // print('Connection Failed');
        print("Email atau password tidak tepat");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email atau password Kurang tepat")));
      }
    } catch (error) {
      print(error);
    }
  }
  // Future<void> login() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (_passwordController.text.isNotEmpty && _usernameController.text.isNotEmpty) {
  //     if (_usernameController.text == pref.getString('username') && _passwordController.text == pref.getString('password')) {
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) => _buildPopupDialog(context, _usernameController.text),
  //       );

  //       Get.to(HomeNavbarButton());
  //     } else {
  //       if (_passwordController.text != pref.getString('password')) {
  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Wrong username or password")));
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("your account is not registered yet")));
  //       }
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("please fill in the blank")));
  //   }
  // }
}

Widget _buildPopupDialog(BuildContext context, String username) {
  return AlertDialog(
    title: const Text('Popup example'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hello " + username),
      ],
    ),
  );
}
