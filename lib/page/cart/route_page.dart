import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_mobile/widget/big_banner.dart';
import 'package:resto_mobile/widget/line.dart';
import 'package:resto_mobile/widget/scrool_view.dart';
import 'package:resto_mobile/widget/top_button.dart';

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
              child: Container(),
              preferredSize: Size(0, 50),
            ),
            // pinned: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.55,
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
            300, 
            // MediaQuery.of(context).size.height,
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
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
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
                                color: Colors.grey[100]
                              ),
                              child: Row(
                                children: [
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const[
                                         Text(
                                          "Jalan Graha Anumerta No. 18, Surabaya",
                                          style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87),
                                        ),
                                        SizedBox(
                                              height: 5,
                                        ),
                                        Text(
                                          "0.8 Km left",
                                          style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
                                        ),
                                      ],
                                    )
                                ],
                              ),
                            ),
                            const SizedBox(
                                  height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey[100],
                                      child: const Icon(Icons.person, color: Colors.black45,)
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Dhani Dwi A.",
                                          style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87),
                                        ),
                                        const SizedBox(
                                              height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const[
                                            Icon(
                                              Icons.star,
                                              size: 12,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "4.7",
                                              style:  TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                BuildListfood(),
                                BuildListfood(),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
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
                                color: Color(0xffFFA593),
                                borderRadius: BorderRadius.circular(15)),
                              child: Center(child: Text("Send To Bakery",  style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
                                    )),
                            )
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width,
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

  Padding BuildListfood() {
    return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
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
                                          SvgPicture.asset("assets/images/cake_bithday.svg", height: 20, width: 20,),
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
