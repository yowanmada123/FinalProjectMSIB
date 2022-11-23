import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/login/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../mainpage.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  int splashtime = 4;
  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Get.offAll(MainPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/logo.png",matchTextDirection: true,
          height: 300,
          width: 300,)
      ),
    );
  }
}
