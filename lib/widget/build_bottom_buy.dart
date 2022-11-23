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
              // Get.to(const CartPage());
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
                Icons.shopping_bag_outlined,
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
              // Get.to(const CartPage());
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
        print('Connection OK');
        print(response.body);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Barang Anda Telah Ditambahkan Kedalam Keranjang")));
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // Get.offAll(const LoginPage());
        // Get.offAll(const EnableLocationPage());
      } else {
        // print('Connection Failed');
        print("Barang Gagal Dimasukan Dalam Keranjang");
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Koneksi")));
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Koneksi Error")));
    }
  }
}
