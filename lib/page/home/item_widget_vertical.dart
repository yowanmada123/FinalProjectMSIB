import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/data_product.dart';
import 'package:resto_mobile/page/detailpage/detail_product_page.dart';
import 'package:resto_mobile/utils/color.dart';

class ItemWidgetVercital extends StatefulWidget {
  const ItemWidgetVercital({Key? key}) : super(key: key);

  @override
  State<ItemWidgetVercital> createState() => _ItemWidgetVercitalState();
}

class _ItemWidgetVercitalState extends State<ItemWidgetVercital> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(DetailProductPage(product: allData[0],));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical:10.0),
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/morefood1.jpg",
                      // profileImage,
                      width: 90,
                      height: 90,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ahmad Ali Jabir",
                        // name,
                        style: TextStyle(color: Colors.black87, fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          // const Icon(IconData(0xf518, fontFamily: 'MaterialIcons')),
                          Icon(
                            Icons.location_on_outlined,
                            size: 15,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "78th Street. 88 W 21th St, NY",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[400],
                              // decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          // const Icon(IconData(0xf518, fontFamily: 'MaterialIcons')),
                          Icon(
                            Icons.timelapse_rounded,
                            size: 15,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "4 min . 1.5 km",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[400],
                              // decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: secondaryColor,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: secondaryColor,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: secondaryColor,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: secondaryColor,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: secondaryColor,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "(5.0)",
                            // star,
                            style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // TryItemWidget(),
            ],
          ),
        ),
      ),
    );
  }
}