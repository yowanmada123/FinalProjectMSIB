import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/data_product.dart';
import 'package:resto_mobile/page/detailpage/detail_product_page.dart';
import 'package:resto_mobile/utils/color.dart';

class ItemWidgetFavorite extends StatelessWidget {
  final FavoriteProduct product;
  const ItemWidgetFavorite({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            // padding: const EdgeInsets.all(16),
            height: 170,
            width: Get.width * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: 
                // AssetImage("assets/images/morefood1.jpg"),
                AssetImage(product.image),
                fit: BoxFit.fill,
              ),
              // border: Border.all(color: Colors.black87,),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 16,
          right: 16,
          child: SizedBox(
            width: Get.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    // padding: const EdgeInsets.only(left: 16.0),
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Center(
                        child: Text(
                      "GET NOW",
                      style: TextStyle(fontSize: 10, color: OprimaryColor , fontWeight: FontWeight.w800),
                    ))),
                // Container(
                //     // padding: const EdgeInsets.only(left: 16.0),
                //     height: 18,
                //     width: 40,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: const [
                //         Icon(
                //           Icons.star,
                //           color: Colors.amber,
                //           size: 10,
                //         ),
                //         Text(
                //           "4.0",
                //           style: TextStyle(fontSize: 10, color: Colors.black87, fontWeight: FontWeight.w400),
                //         ),
                //       ],
                //     )),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 60,
            width: Get.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.2), //(x,y)
                  blurRadius: 0.1,
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.sold+","+product.description,
                      // "843 Terjual, Hungarian Cake for Desert",
                      style: TextStyle(fontSize: 11, color: Colors.grey[400], fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        )
      ]),
    );
  }
}
