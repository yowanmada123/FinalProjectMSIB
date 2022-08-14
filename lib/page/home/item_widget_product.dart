import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/data_product.dart';
import 'package:resto_mobile/page/detailpage/detail_page.dart';
import 'package:resto_mobile/page/detailpage/detail_page_second.dart';

class ItemWidgetProduct extends StatelessWidget {
  const ItemWidgetProduct({
    Key? key,
    required this.product,
  }) : super(key: key);
  final FavoriteProduct product;
  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(MainController());
    return GestureDetector(
      onTap: () {
        Get.to(DetailPageSecond(product: product,));
        // controller.isHomePage.value = false;
      },
      child: Stack(
        children: [
        Container(
          width: 180,
          height: 176,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  // offset: Offset(0.0, 0.0), //(x,y)
                  blurRadius: 0.1,
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 8.67, top: 8.67),
          child: Column(
            children: [
              Container(
                  width: 127.45,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.67),
                    image: DecorationImage(
                      image: 
                      // AssetImage("assets/images/morefood1.jpg"),
                      AssetImage(product.image),
                      fit: BoxFit.fill,
                    ),
                    
                  ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 8.67, top: 105),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                product.name,
                style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.black54),
              ),
              const SizedBox(height: 8),
               Container(
                    width: 127,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(8.67),
                    ),
                    child: Center(
                      child: Text(
                        '\$${product.finalprice}',
                        style: const TextStyle(
                            // decoration: TextDecoration.lineThrough,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54),
                      ),
                    ),
                  )
            ],
          ),
        )
      ]),
    );
  }
}
