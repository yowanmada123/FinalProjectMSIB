import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/Repository.dart';
import 'package:resto_mobile/data/model_wishlists.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class BuildTopBar extends StatefulWidget {
  const BuildTopBar({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;
  @override
  State<BuildTopBar> createState() => _BuildTopBarState();
}

class _BuildTopBarState extends State<BuildTopBar> {
  Repository repository = Repository();
  late Future<List<Wishlists>> futureAlbum;
  late List<Wishlists> dataItem;
  late int idwislist;
  bool isFavorite = false;
  late SharedPreferences pref;

  Future<void> getToken() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<void> getWishlists() async {
    dataItem = await futureAlbum;
    for (int i = 0; i < dataItem.length; i++) {
      if (widget.id == dataItem[i].product.idProduct) {
        setState(() {
          isFavorite = !isFavorite;
        });
        idwislist = dataItem[i].id;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = repository.getWishlists();
    getWishlists();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.15, vertical: 20.81),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.back();
              // controller.isHomePage.value = true;
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.2), //(x,y)
                      blurRadius: 1,
                    ),
                  ],
                  color: Colors.white,
                  // shape: BoxShape.circle, color: Color(0xff64A1F4)
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: const [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.2), //(x,y)
                        blurRadius: 1,
                      ),
                    ],
                    color: Colors.white,
                    // shape: BoxShape.circle, color: Color(0xff64A1F4)
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (isFavorite == false) {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                            addToWishlist(widget.id, pref.getString('token'));
                          } else {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                            deleteWishlist(idwislist, pref.getString('token'));
                          }
                        },
                        child: isFavorite == true
                            ? const Icon(
                                Icons.favorite,
                                size: 20,
                                color: Colors.pink,
                              )
                            : const Icon(
                                Icons.favorite_border_rounded,
                                size: 20,
                                color: Colors.pink,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

void setFavorite() {}

Future<void> addToWishlist(int id, var token) async {
  try {
    final response = await http.post(
      Uri.parse('https://api1.sib3.nurulfikri.com/api/wishlist'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, String>{
        'product_id': id.toString(),
      }),
    );
    print(response.statusCode);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      print('Connection OK');
      print(response.body);
    } else {
      // print('Connection Failed');
      print("Barang Gagal Dimasukan Dalam Keranjang");
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Koneksi")));
    }
  } catch (error) {
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Koneksi Error")));
  }
}

Future<void> deleteWishlist(int id, var token) async {
  try {
    final response = await http.delete(
      Uri.parse('https://api1.sib3.nurulfikri.com/api/wishlist/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.statusCode);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      print('Connection OK');
      print(response.body);
    } else {
      // print('Connection Failed');
      print("Barang Gagal Dimasukan Dalam Keranjang");
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Koneksi")));
    }
  } catch (error) {
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Koneksi Error")));
  }
}
