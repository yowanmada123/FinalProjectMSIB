import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/base/form/form_scaffold.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isPesanAntar = true;

  @override
  Widget build(BuildContext context) {
    return OScaffold(
      title: "Profile",
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   // elevation: 0.000001,
      //   backgroundColor: primaryColor,
      //   centerTitle: true,
      //   title: const Text("Profile", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
      // ),
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Stack(
              children:[
                // Container(
                //   height: 50,
                //    decoration: BoxDecoration(
                //     color: primaryColor,
                //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200)),
                //   ),
                // ),
                 Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
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
                            image:
                                // AssetImage("assets/images/morefood1.jpg"),
                                AssetImage('assets/images/people.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Jack Adam", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87)),
                      Text("+62 832 6588 878", style: TextStyle(fontSize: 12, color: Colors.grey[400])),
                      const SizedBox(
                        height: 20,
                      ),
                      BuildSettingItem(
                        item: 'My Profile',
                        ontap: (){},
                      ),
                      BuildSettingItem(
                        item: 'Change Password',
                        ontap: (){},
                      ),
                      BuildSettingItem(
                        item: 'Notification',
                        ontap: (){},
                      ),
                      BuildSettingItem(
                        item: 'About Us',
                        ontap: (){},
                      ),
                      BuildSettingItem(
                        item: 'Contact Us',
                        ontap: (){},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width* 0.9,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: Text("Sign Out", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: Colors.black54)),),
                      )
                    ],
                  ),
                ),
              ]
            ),
          ),
        ]),
      ),
    );
  }
}

class BuildSettingItem extends StatelessWidget {
  const BuildSettingItem({Key? key, required this.item, required this.ontap}) : super(key: key);

  final String item;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey)),
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

  const BuildItem({Key? key, required this.judul, required this.orderStatus, required this.time}) : super(key: key);

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
                  decoration: BoxDecoration(color: Color(0xffC5F0EF), borderRadius: BorderRadius.circular(10)),
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
                      style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // time,
                      orderStatus,
                      style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // time,
                      time,
                      style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
