import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/splahscreen/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      home: SplashScreenPage(),
    );
  }
}
