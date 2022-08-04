import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Row(
                    children:  [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Color.fromARGB(255, 251, 126, 167),
                        child: Icon(
                          Icons.person, 
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                                const Text(
                                "Jacob Wow", style: TextStyle(color: Colors.white),),
                               const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 200,
                                  child:const Text(
                                  "I love korean spicy food, indonesian food and west food",
                                  style: TextStyle(color: Colors.grey, fontSize: 15),
                                  maxLines: 2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 100,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 253, 165, 194),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(child: Text("Edit Profile", style: TextStyle(color: Colors.white),)),
                                )
                              
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                //   child: Text(
                //     "History Pesanan",
                //     style: TextStyle(color: Color.fromARGB(221, 36, 36, 36), fontSize: 20, fontWeight: FontWeight.w700),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.grey,
                  height: 0.1,
                ),
               const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: const [
                            Text("24", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("History", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 14  ),),
                          ],
                        ),
                      ),
                       Expanded(
                        flex:1,
                         child: Column(
                          children: const [
                            Text("100", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Likes", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 14  ),),
                          ],
                                             ),
                       ),
                       Expanded(
                        flex:1,
                         child: Column(
                          children: const [
                            Text("24", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Cart", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 14  ),),
                          ],
                                             ),
                       )
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ]),
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
                  children:  [
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
