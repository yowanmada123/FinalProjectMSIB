import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  Image.asset("assets/images/regis.png"),
                  const Text(
                    "Did you don't have an account ?",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Go get your account now ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff6B5E5E),
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFAFA),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xffCCC9C9))),
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
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFAFA),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xffCCC9C9))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Color(0xffA9A9A9),
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
            GestureDetector(
              onTap: () {
                register();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: const Color(0xffFF485A)),
                  child: const Center(
                      child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }

  Future<void> register() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (_passwordController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty) {
      await pref.setString("username", _usernameController.text);
      await pref.setString("password", _passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Your Account Has Been Created")));
      Get.to(const LoginPage());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Username atau password tidak boleh kosong")));
    }
  }
}
