import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/login/login_page.dart';

import '../global_controller.dart';
import 'home/home_navbar.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   final cGlobal = Get.put(GlobalController());
   void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => init());
  }

  init() async {
    if (cGlobal.token != '') {
      log(cGlobal.token);
      Get.offAll(HomeNavbarButton());
    } else {
      Get.offAll(const LoginPage());
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
