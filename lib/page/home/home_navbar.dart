import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/global_controller.dart';
import 'package:resto_mobile/page/home/enable_location.dart';
import 'package:resto_mobile/page/home/home_page.dart';
import 'package:resto_mobile/page/order_history/order_history.dart';
import 'package:resto_mobile/page/order_history/timeline_page.dart';
import 'package:resto_mobile/page/profile/profile_page.dart';
import 'package:resto_mobile/utils/color.dart';

class HomeNavbarButton extends StatelessWidget {
  final gstate = Get.put(GlobalController());
  HomeNavbarButton({
    Key? key,
  }) : super(key: key);

  final List<Widget> _children = [
    const HomePage(),
    const OrderHistoryPage(),
    const ProfilePage(),
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
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped, // new
            currentIndex: gstate.tabHomeIndex.toInt(), // new
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home, color: Colors.grey,),
                // SvgPicture.asset("assets/ic/ic_home_inactive.svg"),
                label: 'Beranda',
                activeIcon: Icon(Icons.home, color: primaryColor)
                // SvgPicture.asset("assets/ic/ic_home_active.svg"),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.history, color: Colors.grey,),
                // SvgPicture.asset("assets/ic/ic_home_inactive.svg"),
                label: 'History',

                activeIcon: Icon(Icons.history, color: primaryColor),
                // SvgPicture.asset("assets/ic/ic_home_active.svg"),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person, color: Colors.grey,),
                // SvgPicture.asset("assets/ic/ic_home_inactive.svg"),
                label: 'Profil',
                activeIcon: Icon(Icons.person, color: primaryColor)
                // SvgPicture.asset("assets/ic/ic_home_active.svg"),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
