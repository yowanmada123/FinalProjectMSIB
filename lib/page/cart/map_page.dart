import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/utils/color.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

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
            expandedHeight: Get.height * 0.57,
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
                  bottom: -10,
                  left: 0,
                  right: 0,
                ),
              ],
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 
            450, 
            // Get.height,
            delegate: SliverChildListDelegate(
                [
                  BuildItemDescription(context),
                ],
              ),
          ),
        ],
      ),
    ), 
    );
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
                  height: 20,
                  width: Get.width * 0.86,
                  child: const Text("Taki - Taki Bruno, Citraland",
                  style:  TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87),),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Icon(Icons.map),
                SizedBox(
                  height: Get.height,
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
                                borderRadius: BorderRadius.circular(8),
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
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset("assets/images/ic_location.png", width: 30, height: 30,)),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          
                                           const Text(
                                            "Jalan Graha Anumerta No. 18. RT. 28 RW. 13, Sambikrep, Surabaya",
                                            style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87),
                                          ),
                                          const SizedBox(
                                                height: 10,
                                          ),
                                          const Text(
                                            "0.8 Km left",
                                            style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
                                          ),
                                          const SizedBox(
                                                height: 10,
                                          ),
                                          Container(
                                            width: 115,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(0.0, 0.1), //(x,y)
                                                  blurRadius: 0.1,
                                                ),
                                              ],
                                            ),
                                            child: Row(children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset("assets/images/ic_direction.png", width: 10, height: 10,),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "Petunjuk arah",
                                                style:  TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
                                              ),
                                            ]),
                                          )
                                        ],
                                      ),
                                  )
                                ],
                              ),
                            ),
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
                                      "Any Pick-up notes ?",
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
                                borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text("Send To Bakery",  style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
                                    )),
                            )
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

}
