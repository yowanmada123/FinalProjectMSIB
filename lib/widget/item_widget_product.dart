import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/detailpage/detail_page.dart';
import 'package:resto_mobile/page/detailpage/detail_page_second.dart';

class ItemWidgetSecond extends StatelessWidget {
  const ItemWidgetSecond({
    Key? key,
    required this.images,
    required this.warna,
    required this.name,
    required this.firstprice,
    required this.finalprice,
  }) : super(key: key);

  final String images;
  final Color warna;
  final String name;
  final String firstprice;
  final String finalprice;

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(MainController());
    return GestureDetector(
      onTap: () {
        // Get.to(DetailPageSecond(image: images, name: name, firstprice: firstprice, finalprice: finalprice,));
        // controller.isHomePage.value = false;
      },
      child: Stack(
        children: [
        Container(
          width: 145.65,
          height: 176,
          decoration: BoxDecoration(
            color: warna,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.67, right: 8.67, top: 8.67),
          child: Column(
            children: [
              Container(
                  width: 127.45,
                  height: 90,
                  decoration: BoxDecoration(
                    color: warna,
                    borderRadius: BorderRadius.circular(8.67),
                  ),
                  child: FittedBox(
                      fit: BoxFit.contain, 
                      child: 
                      SvgPicture.asset(
                        images,
                        // 'assets/images/cake_slice.svg',
                        matchTextDirection: true,
                        height: 15,
                        width: 15,
                      ),
                      // Image.asset(images),
                  ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.67, right: 8.67, top: 105),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                name,
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
                    child: const Center(
                      child: Text(
                        "\$3.50",
                        style: TextStyle(
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
