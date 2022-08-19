import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/utils/color.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(MainController());
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size(0, 50),
              child: Container(),
            ),
            // pinned: false,
            expandedHeight: Get.height * 0.55,
            flexibleSpace: Stack(
              children: [
                 Positioned(
                    // ignore: sort_child_properties_last
                    child: 
                    Container(
                      color: const Color(0xffD4F0FE),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset("assets/images/map.PNG")),
                    ),
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0
                 ), 
                Positioned(
                  // ignore: sort_child_properties_last
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(
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
            350, 
            // Get.height,
            delegate: SliverChildListDelegate(
                [
                  BuildItemDescription(context),
                ],
              ),
          ),
        ],
      ),
    ));
  }

  Widget BuildItemDescription(BuildContext context) {
    return Stack(
      children:[
         Positioned(
          top: 0,
          left: 0,
          right: 0,
           child: Container(
            decoration: const BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: Column(
              children: [
                SizedBox(
                  // height: Get.height,
                  width: Get.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.15, right: 24.28),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 0.2), //(x,y)
                                    blurRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset("assets/images/ic_location.png", width: 20, height: 20,),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const[
                                         Text(
                                          "Jalan Graha Anumerta No. 18, Surabaya",
                                          style:  TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black87),
                                        ),
                                        SizedBox(
                                              height: 5,
                                        ),
                                        Text(
                                          "0.8 Km left",
                                          style:  TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey),
                                        ),
                                      ],
                                    )
                                ],
                              ),
                            ),
                            const SizedBox(
                                  height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.asset(
                                          "assets/images/people.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const[
                                          Text(
                                            "Dhani Dwi A.",
                                            style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87),
                                          ),
                                          SizedBox(
                                                height: 5,
                                          ),
                                          Text(
                                            "Courier",
                                            style:  TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
                                          ),
                                        ],
                                      )      
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    CircleAvatar(
                                      minRadius: 15,
                                      backgroundColor: primaryColor, 
                                      child: const Icon(
                                        Icons.call, 
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    CircleAvatar(
                                      minRadius: 15,
                                      backgroundColor: primaryColor, 
                                      child: const Icon(
                                        Icons.message, 
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              width: Get.width,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  BuildListfood(),
                                  BuildListfood(),
                                  BuildListfood(),
                                  BuildListfood(),
                                ],
                              ),
                            ),
                            // Row(
                            //   children: [
                                
                            //   ],
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: Get.width,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8)),
                              child: 
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Any Pick-up notes for bakery ?",
                                      style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey[600]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                              child: const Center(child: Text("Live Tracking",  style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
                                    )),
                            )
                            // SizedBox(
                            //   width: Get.width,
                            //   // height: 110,
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: const [
                            //       Text("Description", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87)),
                            //       SizedBox(
                            //         height: 10,
                            //       ),
                            //       Text(
                            //         "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.",
                            //         style: TextStyle(fontSize: 12, color: Colors.black54),
                            //         textAlign: TextAlign.justify,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(60)), color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
                 ),
         ),
         Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: Container() 
          // BuildBottomBuy(context),
          )
      ]
    );
  }

  // ignore: non_constant_identifier_names
  Padding BuildListfood() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(10)
            ),
            child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/morefood3.jpg",
                        width: 35,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // SvgPicture.asset("assets/images/cake_bithday.svg", height: 20, width: 20,),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                          Text(
                          "Tropical Cake",
                          style:  TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black87),
                        ),
                          SizedBox(
                              height: 5,
                        ),
                          Text(
                          "x2",
                          style:  TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey),
                        ),
                        
                      ],
                    )
                  ],
                ),
              ],
          ),
            ),
          )
        ],
      ),
    );
  }
}
