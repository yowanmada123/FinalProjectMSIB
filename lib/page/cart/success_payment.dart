import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/utils/color.dart';

import '../home/widget/home_navbar.dart';

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          Get.offAll(HomeNavbarButton());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              "assets/images/ic_location.png",
              height: 150,
              width: 150,
            )
                // SvgPicture.asset("assets/ic/ic_email_dikirim.svg"),
                ),
            const SizedBox(
              height: 16,
            ),
            Text("Pembayaran Sukses ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black)),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Silakan tunggu barang hingga sampai dan jika barang tak kunjung sampai anda dapat mengirimkan email ke ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                  // style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'manjabangetaku@gmail.com ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: OsecondaryColor)),
                    const TextSpan(
                      text: 'untuk dapat melanjutkan proses complain melalui customer care kami',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                    // TextSpan(text: ' world!'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
