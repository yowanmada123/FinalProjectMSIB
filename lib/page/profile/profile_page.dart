import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/login/login_page.dart';
import 'package:resto_mobile/page/profile/change_password.dart';
import 'package:resto_mobile/page/profile/my_profile.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/base/form/form_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isPesanAntar = true;
  String name = "";
  String email = "";
  String handphone = "";
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("user.name")!;
      email = prefs.getString("user.email")!;
      handphone = prefs.getString("user.handphone")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: OprimaryColor,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Stack(children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(200),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/people.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(name,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(email,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black87)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(handphone,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black87)),
                    const SizedBox(
                      height: 20,
                    ),
                    BuildSettingItem(
                      icon: const IconData(0xe491, fontFamily: 'MaterialIcons'),
                      item: 'My Profile',
                      ontap: () {
                        Get.to(const MyProfilePage());
                      },
                    ),
                    BuildSettingItem(
                      icon: const IconData(0xf889, fontFamily: 'MaterialIcons'),
                      item: 'Change Password',
                      ontap: () {
                        Get.to(const ChangePasswordPage());
                      },
                    ),
                    BuildSettingItem(
                      icon: const IconData(0xe450, fontFamily: 'MaterialIcons'),
                      item: 'Notification',
                      ontap: () {},
                    ),
                    BuildSettingItem(
                      icon:
                          const IconData(0xf005c, fontFamily: 'MaterialIcons'),
                      item: 'About Us',
                      ontap: () {},
                    ),
                    BuildSettingItem(
                      icon: const IconData(0xe126, fontFamily: 'MaterialIcons'),
                      item: 'Contact Us',
                      ontap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // FirebaseAuth.instance.signOut();
                        _onWillPop();
                      },
                      child: Container(
                        height: 50,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text("Sign Out",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: Get.context!,
          builder: (context) => AlertDialog(
            contentPadding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
            content: const Text('Yakin ingin Log Out aplikasi ?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () => Get.offAll(const LoginPage()),
                child: const Text('Ya'),
              ),
            ],
          ),
        )) ??
        false;
  }
}

class BuildSettingItem extends StatelessWidget {
  const BuildSettingItem(
      {Key? key, required this.item, required this.ontap, required this.icon})
      : super(key: key);
  final IconData icon;
  final String item;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 15,
                  color: Colors.grey[400],
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(item,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
              size: 13,
            )
          ],
        ),
      ),
    );
  }
}

class BuildItem extends StatelessWidget {
  final String judul;
  final String orderStatus;
  final String time;

  const BuildItem(
      {Key? key,
      required this.judul,
      required this.orderStatus,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.00, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Color(0xffC5F0EF),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.food_bank,
                    color: Color(0xffDD1138),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      judul,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // time,
                      orderStatus,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // time,
                      time,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
