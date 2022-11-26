import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/home/widget/home_navbar.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/base/form/form_scaffold.dart';

class EnableLocationPage extends StatefulWidget {
  const EnableLocationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<EnableLocationPage> createState() => _EnableLocationPageState();
}

class _EnableLocationPageState extends State<EnableLocationPage> {
  bool isPesanAntar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: ExactAssetImage("assets/images/map_distance.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Set your locatioin to start exploring",
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 5),
            const Text(
              "restaurant around you",
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                Get.offAll(HomeNavbarButton());
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Akses Lokasi telah diberikan")));
              },
              child: Container(
                height: 50,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: OsecondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                    child: Text(
                  "Enable Location",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Tolong berikan izin akses lokasi")));
              },
              child: Container(
                height: 50,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: OdisableButton,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                    child: Text(
                  "No, I do it later",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
