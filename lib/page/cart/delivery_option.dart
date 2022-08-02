import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/widget/base/form/form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: SafeArea(
     child: Form(
          key: _key,
          child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          child: Wrap(
                            children: [
                              Container(
                                  child: Stack(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.close)),
                                      const Center(
                                          child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Text("Login"),
                                      )),
                                    ],
                                  ),
                                ),
                              OFormText(
                                title: "EMAIL",
                                controller: _emailController,
                                formType: FormType.email,
                              ),
                              OFormText(
                                title: "PASSWORD",
                                controller: _passwordController,
                                formType: FormType.password,
                              ),
                              Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: InkWell(
                                    onTap: () {
                                      // bottomSheetWidget(heightFactor: 0.8, context: context, child: ForgotPassPage());
                                    },
                                    child: Text("Lupa Password ?")),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
      
                    // OButtonBar(
                    //   title: "LANJUT",
                    //   onPressed: () {
                    //     // Get.offAll(ListProfil());
                    //     if (_key.currentState!.validate()) {
                    //       c.email = _emailController.text;
                    //       c.password = _passwordController.text;
                    //       c.loginByEmail();
                    //       log("login");
                    //     }
                    //   },
                    //   // color: Color(primaryDark),
                    //   // textColor: Colors.white,
                    // ),
                  ],
                ),
        ),
   ),
    );
  }
}
