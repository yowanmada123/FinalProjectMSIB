import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Widget BuildBottomBuy(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Positioned(
    bottom: 0,
    child: Container(
        color: Colors.white,
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: size.width,
                height: 73.72,
                color: const Color(0xff64A1F4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.chat,
                      color: Colors.white,
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey[350],
                    ),
                    const Icon(Icons.shopping_cart_sharp, color: Colors.white)
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  // Get.to(const CartPage());
                },
                child: Container(
                  width: size.width,
                  height: 73.72,
                  color: const Color(0xffFF485A),
                  child: const Center(
                      child: Text(
                    "Beli Sekarang",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            )
          ],
        )),
  );
}
