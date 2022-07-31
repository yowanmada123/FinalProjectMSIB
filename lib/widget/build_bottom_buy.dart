import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/cart/cart_page.dart';

// ignore: non_constant_identifier_names
Widget BuildBottomBuy(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Positioned(
    bottom: 0,
    child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Color(0xffFFA593),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.card_giftcard_sharp,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(CartPage());
                },
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                ))
          ],
        )),
  );
}
