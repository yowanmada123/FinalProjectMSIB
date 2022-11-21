import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/cart/cart_page.dart';
import 'package:resto_mobile/page/cart/route_page.dart';
import 'package:resto_mobile/utils/color.dart';

// ignore: non_constant_identifier_names
Widget BuildBottomBuy() {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: (){
            Get.to(const CartPage());
          },
          child: Container(
              height: 50,
              width: Get.width * 0.1,
              // Get.width * 0.9,
              decoration: BoxDecoration(
                color: OprimaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: 
              const Icon(
                Icons.shopping_bag_outlined ,
                color: Colors.white,
              ),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 5,
        child: GestureDetector(
          onTap: (){
            Get.to(const CartPage());
          },
          child: Container(
              height: 50,
              width: Get.width * 0.5,
              // Get.width * 0.9,
              decoration: BoxDecoration(
                color: OsecondaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  Icon(
                    Icons.card_giftcard_sharp,
                    color: Colors.white,
                  ),
                   SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Buy Now",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                  )
                ],
              ),
          ),
        ),
      ),
      
    ],
  );
}
