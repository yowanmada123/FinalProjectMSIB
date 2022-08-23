import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/base/form/form_scaffold.dart';

class OtpInputPage extends StatefulWidget {
  const OtpInputPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpInputPage> createState() => _OtpInputPageState();
}

class _OtpInputPageState extends State<OtpInputPage> {
  bool isPesanAntar = true;

  @override
  Widget build(BuildContext context) {
    return OScaffold(
      title: "Input OTP",
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Forgot Password", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.black87)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("An OTP code was sent to your email. Enter it here:", style: TextStyle(fontSize: 13, color: Colors.grey[400])),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        // width: Get.width * 0.9,
                        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 25,
                            ),
                            // Icon(Icons.email_outlined, size: 18, color: Colors.grey),
                            // SizedBox(
                            //   width: 20,
                            // ),
                            Text("Enter OTP Code", style: TextStyle(fontSize: 13, color: Colors.grey)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      
                      Container(
                        height: 50,
                        // width: Get.width * 0.9,
                        decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text("Next", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
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

class BuildSettingItem extends StatelessWidget {
  const BuildSettingItem({Key? key, required this.item, required this.ontap, required this.contain}) : super(key: key);
  final String contain;
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
            Text(item, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey)),
            Text(contain, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87)),
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
                      style: const TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // time,
                      orderStatus,
                      style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // time,
                      time,
                      style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
