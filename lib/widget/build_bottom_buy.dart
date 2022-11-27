import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/model_products.dart';
import 'package:resto_mobile/page/cart/cart_page.dart';
import 'package:http/http.dart' as http;
import 'package:resto_mobile/utils/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtomBuy extends StatefulWidget {
  const ButtomBuy({super.key, required this.product});
  final Products product;

  @override
  State<ButtomBuy> createState() => _ButtomBuyState();
}

class _ButtomBuyState extends State<ButtomBuy> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              addToCart(widget.product.idProduct);
            },
            child: Container(
              height: 50,
              width: Get.width * 0.1,
              // Get.width * 0.9,
              decoration: BoxDecoration(
                color: OprimaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.add,
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
            onTap: () {
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
                children: const [
                  Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Go To Cart Now",
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

  Future<void> addToCart(int id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    print(token);
    print(id);
    try {
      final response = await http.post(
        Uri.parse('https://api1.sib3.nurulfikri.com/api/keranjang'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8', 
          'Accept': 'application/json', 
          'Authorization': 'Bearer $token'},
        body: jsonEncode(<String, String>{
          'product_id': id.toString(),
          'qty': "1",
        }),
      );
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode < 400) {
      Get.snackbar(
        'Succeeded',
        'Your Item Has Been Added To Cart',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Failed',
        'Item failed to be added to cart',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Koneksi Error")));
    }
  }
}
