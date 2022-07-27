import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/global_controller.dart';
import 'package:resto_mobile/page/home/home_page.dart';

class HomeNavbarButton extends StatelessWidget {
  final gstate = Get.put(GlobalController());
  HomeNavbarButton({
    Key? key,
  }) : super(key: key);

  final List<Widget> _children = [
    const HomePage(),
    // // Option Title for StatusPage
    // // "Analyst", "Pick-Up", "Delivery",
    // // "Admin", "Dokter", "Customer Relation"
    // // "Supervisor Lab"
    // const StatusPage(title: "Analyst"),
    // const QRCreatePage(),
    // const StatusPage(title: "Delivery"),
    // const AkunPage(),
  ];

  void onTabTapped(int index) {
    gstate.tabHomeIndex.value = index;
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: Get.context!,
          builder: (context) => AlertDialog(
            contentPadding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
            content: const Text('Yakin ingin keluar aplikasi ?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Ya'),
              ),
            ],
          ),
        )
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Obx(() => _children[gstate.tabHomeIndex.toInt()]), //
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped, // new
            currentIndex: gstate.tabHomeIndex.toInt(), // new
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home, color: Colors.grey,),
                // SvgPicture.asset("assets/ic/ic_home_inactive.svg"),
                label: 'Beranda',
                activeIcon: Icon(Icons.home, color: Colors.purple[300],)
                // SvgPicture.asset("assets/ic/ic_home_active.svg"),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person, color: Colors.grey,),
                // SvgPicture.asset("assets/ic/ic_home_inactive.svg"),
                label: 'Profil',
                activeIcon: Icon(Icons.person, color: Colors.purple[300],)
                // SvgPicture.asset("assets/ic/ic_home_active.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
