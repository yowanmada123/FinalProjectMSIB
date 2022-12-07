import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../utils/color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _handPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool isShow = false;
  bool isShow2 = false;

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
                  Image.asset("assets/images/register.png",
                  matchTextDirection: true,
                    height: 250,
                    width: 250,),
                  const Text(
                    "Didn't you want our cake ?",
                    style: TextStyle(fontSize: 20, color: Color(0xff6B5E5E), fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Go get your cake now ",
                    style: TextStyle(fontSize: 16, color: Color(0xff6B5E5E), fontWeight: FontWeight.w400),
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
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: "Username",
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.person,
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
                        controller: _handPhoneController,
                        decoration: const InputDecoration(
                          labelText: "Handphone",
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.phone,
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
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(color: const Color(0xffFFFAFA), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xffCCC9C9))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: isShow,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isShow2 = !isShow2;
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
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                register();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  width: Get.width,
                  height: 45,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(27), color: OprimaryColor),
                  child: const Center(
                      child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.offAll(const LoginPage());
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Did you have an account ? ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      // TextSpan(text: ' world!'),
                    ],
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
    );
  }

  Future<void> register() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (_passwordController.text.isNotEmpty && _usernameController.text.isNotEmpty && _handPhoneController.text.isNotEmpty && _passwordController.text.isNotEmpty && _confirmPasswordController.text.isNotEmpty) {
      if (_passwordController.text == _confirmPasswordController.text) {
        try {
          final response = await http.post(
            Uri.parse('https://api1.sib3.nurulfikri.com/api/register'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{'name': _usernameController.text, 'email': _emailController.text, 'handphone': _handPhoneController.text, 'password': _passwordController.text, 'password_confirmation': _confirmPasswordController.text}),
          );

          print(response.statusCode);

          if (response.statusCode >= 200 && response.statusCode < 400) {
            print('Connection OK');
            print(response.body);
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Akun Berhasil Dibuat")));
            // SharedPreferences pref = await SharedPreferences.getInstance();
            Get.offAll(const LoginPage());
            // Get.offAll(const EnableLocationPage());
          } else {
            // print('Connection Failed');
            print("Akun Gagal dibuat");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Koneksi")));
          }
        } catch (error) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Harap isi semua form")));
        }
      }
      // await pref.setString("username", _usernameController.text);
      // await pref.setString("password", _passwordController.text);
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Your Account Has Been Created")));
      // Get.to(const LoginPage());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Harap isi semua form")));
    }
  }
}
