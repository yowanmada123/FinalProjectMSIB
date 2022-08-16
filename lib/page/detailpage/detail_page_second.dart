// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/data_image.dart';
import 'package:resto_mobile/data/data_product.dart';
import 'package:resto_mobile/widget/build_bottom_buy.dart';

class DetailPageSecond extends StatelessWidget {
  DetailPageSecond({
    Key? key,
    required this.product,
  }) : super(key: key);
  final FavoriteProduct product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  bottom: PreferredSize(
                    child: Container(),
                    preferredSize: Size(0, 20),
                  ),
                  pinned: false,
                  expandedHeight: MediaQuery.of(context).size.height * 0.45,
                  flexibleSpace: Stack(
                    children: [
                      Positioned(
                          child: 
                          Container(
                            padding: const EdgeInsets.only(left: 16),
                            height: 100,
                            color: Colors.white,
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: 
                               ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: allImage.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ImageProduct(product: allImage[index],);
                                  }
                                ),
                              // Image.asset(product.image, width: 20, height: 20,),
                            ),
                          ),
                          top: 100,
                          left: 0,
                          right: 0,
                          bottom: 20),
                      const Positioned(child: BuildTopBar(), top: -240, left: 0, right: 0, bottom: 0),
                      Positioned(
                        child: Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.2), //(x,y)
                              blurRadius: 1,
                            ),
                          ],
                            color: Colors.white,
                            // Colors.lightBlue[100],
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50),
                            ),
                          ),
                        ),
                        bottom: -2,
                        left: 0,
                        right: 0,
                      ),
                    ],
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 
                  // 390,
                  MediaQuery.of(context).size.height,
                  delegate: SliverChildListDelegate(
                    [
                      BuildItemDescription(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: BuildBottomBuy(),
          )
        ],
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  Widget BuildItemDescription(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.grey, //New
            //       blurRadius: 0.2,
            //       offset: Offset(0, -0.1))
            // ],
            color: Color(0xffFFFFFF),
          ),
          child: Column(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.15, right: 24.28),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black87),
                              ),
                              Text(
                                "\$${product.finalprice}",
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black87),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4.34,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "5 pieces",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[300],
                                      // decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow[300]),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "800 kkal",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[300],
                                      // decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: Colors.pink[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: Colors.pink[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: Colors.pink[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: Colors.pink[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: Colors.pink[100],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.14),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Color(0xffEFEFEF)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey, width: 0.3)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset("assets/images/ic_time.png", width: 25, height: 25),
                                      const Text(
                                        "20-30 min",
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset("assets/images/ic_food.png", width: 25, height: 25),
                                      const Text(
                                        "4 Serving",
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset("assets/images/ic_fire.png", width: 25, height: 25),
                                      // Icon(
                                      //   Icons.fireplace_outlined,
                                      //   color: Colors.orange[200],
                                      // ),
                                      const Text(
                                        "598 kkal",
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            // height: 110,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Description", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.",
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(60)), color: Colors.black),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Positioned(bottom: 20, left: 16, right: 16, child: BuildBottomBuy(context))
    ]);
  }

  // ignore: non_constant_identifier_names
  Container BuildCustomerReview(BuildContext context, String image, String name, String time, String star, String comment) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.14),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.1), //(x,y)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.42, right: 12.42, top: 13.87, bottom: 17.34),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: Color(0xff7c94b6),
                        borderRadius: BorderRadius.all(Radius.elliptical(320, 220)),
                      ),
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: Image.asset(image)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xff000000))),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(time, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Color(0xffB4BBC6))),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/OrangeStar.png",
                      width: 11.27,
                      height: 11.27,
                    ),
                    Text(
                      star,
                      style: const TextStyle(fontSize: 10.41, fontWeight: FontWeight.w700, color: Color(0xff000000)),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 29,
              child: Text(
                comment,
                style: const TextStyle(fontSize: 8.67, color: Color(0xff272727)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildTopBar extends StatelessWidget {
  const BuildTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
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
                        blurRadius:1,
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
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite,
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
      ),
    );
  }
}

class ImageProduct extends StatelessWidget {
  final ProductImage product;
  const ImageProduct({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Container(
          // padding: const EdgeInsets.all(16),
          height: 180,
          width: MediaQuery.of(context).size.width * 0.917,
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
    ]);
  }
}
