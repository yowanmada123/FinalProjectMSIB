import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/widget/build_bottom_buy.dart';

class DetailPageSecond extends StatelessWidget {
  const DetailPageSecond({
    Key? key,
    required this.image,
    required this.name,
    required this.firstprice,
    required this.finalprice,
  }) : super(key: key);

  final String image;
  final String name;
  final String firstprice;
  final String finalprice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
          Container(color: Color(0xffC5F0EF),),
          BuildItemImage(context),
          BuildItemDescription(context),
          BuildTopBar(context),
          BuildBottomBuy(context),
        ],
        ),
    ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildItemDescription(BuildContext context) {
    return Positioned(
      top: 320,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.15, right: 24.28, top: 30),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87),
                                ),
                                const Text(
                                  "\$3.50",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87),
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
                                    const SizedBox(width: 10,),
                                    Container(
                                      height: 5,
                                      width: 5,
                                      decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.yellow[300]
                                    ),),
                                    const SizedBox(width: 10,),
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
                                Row(children: [
                                  Icon(Icons.star, size: 12,color: Colors.pink[100],),
                                  Icon(Icons.star, size: 12,color: Colors.pink[100],),
                                  Icon(Icons.star, size: 12,color: Colors.pink[100],),
                                  Icon(Icons.star, size: 12,color: Colors.pink[100],),
                                  Icon(Icons.star, size: 12,color: Colors.pink[100],),
                                ],)
                                
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.14),
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey, width: 0.3)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 18),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.,
                                    children: [
                                      Column(
                                        children:  [
                                          Icon(Icons.timelapse_sharp, color: Colors.grey[300],),
                                          Text("20-30 min", style: TextStyle(fontSize: 10),)
                                      ],),
                                      Column(
                                        children:  [
                                          Icon(Icons.food_bank_rounded, color: Colors.grey[400],),
                                          Text("4 Serving", style: TextStyle(fontSize: 10),)
                                      ],),
                                      Column(
                                        children:  [
                                          Icon(Icons.fireplace_outlined, color: Colors.orange[200],),
                                          Text("20-30 min", style: TextStyle(fontSize: 10),)
                                      ],),
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
                                  Text("Deskripsi",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // Text("Ulasan dan Penilaian",
                                  //     style: TextStyle(
                                  //         fontSize: 13,
                                  //         fontWeight: FontWeight.w700,
                                  //         color: Color(0xff47623F))),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15.61,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15.07,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(60)),
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container BuildCustomerReview(BuildContext context, String image, String name,
      String time, String star, String comment) {
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
        padding: const EdgeInsets.only(
            left: 12.42, right: 12.42, top: 13.87, bottom: 17.34),
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
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(320, 220)),
                      ),
                      child: Expanded(child: Image.asset(image)),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff000000))),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(time,
                            style: const TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffB4BBC6))),
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
                      style: const TextStyle(
                          fontSize: 10.41,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000)),
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
                style:
                    const TextStyle(fontSize: 8.67, color: Color(0xff272727)),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildTopBar(BuildContext context) {
    // var controller = Get.put(MainController());
    return Positioned(
      top: 0,
      child: Container(
        height: 80,
        // color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 25.15, vertical: 20.81),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                  // controller.isHomePage.value = true;
                },
                child: 
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      // shape: BoxShape.circle, color: Color(0xff64A1F4)
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: const Expanded(
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: 20,
                      color: Colors.black54,
                    ),
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
                    color: Colors.white,
                      // shape: BoxShape.circle, color: Color(0xff64A1F4)
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Expanded(
                    child: GestureDetector(
                      onTap: (){},
                      child: const Icon(
                        Icons.favorite,
                        size: 20,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildItemImage(BuildContext context) {
    return Positioned(
        top: 80,
        left: 68.5,
        child: SizedBox(
            height: 194.67,
            width: 222,
            child: Column(
              children: [
                Expanded(
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: 
                      SvgPicture.asset(
                        image,
                      // 'assets/images/cake_slice.svg',
                      // matchTextDirection: true,
                      // height: 15,
                      // width: 15,
                    ),
                      // Image.asset(
                      //   image,
                      //   width: 221.99,
                      //   height: 179.5,
                      // ),
                  ),
                ),
                const SizedBox(
                  height: 8.67,
                ),
                // BuildSecondPageLine(context)
              ],
            ),),);
  }
}
