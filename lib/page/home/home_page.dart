import 'package:flutter/material.dart';
import 'package:resto_mobile/data/data.dart';
import 'package:resto_mobile/page/home/item_widget_favorite.dart';
import 'package:resto_mobile/page/home/item_widget_product.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/big_banner.dart';
import 'package:resto_mobile/widget/scrool_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0000001,
        backgroundColor: primaryColor,
        leading: const Icon(Icons.menu, color: Colors.white,),
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
          Text("Canada, Ottawa", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white),),
          SizedBox(width: 10,),
          Icon(Icons.keyboard_arrow_down, color: Colors.white,),
        ],),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.search, color: Colors.white,),
          )
        ],
      ),
      body: SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 260,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.black87
                //   )
                // ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 100,
                        color: primaryColor,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 100,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top:10,
                left:23,
                right: 23,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                    "Tranding Cake",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700 ,color: Colors.white),
                    ),
                    Text(
                    "See all(12)",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400 ,color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 50,
                child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.black)
                  // ),
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemWidgetFavorite(product: allData[index],);
                      }
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 347,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8, 
            ),
            itemCount: allData.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemWidgetProduct(product: allData[index],);
            }, 
            ),
          )
        ],
      )
      
      
      // Stack(
      //   children: [
      //   Column(
      //     // padding: const EdgeInsets.only(right: 21, left: 21, top: 15),
      //     children: [
      //       Stack(
      //         children:[
      //           Container(
      //             height: 320,
      //             width: MediaQuery.of(context).size.width,
      //             decoration: BoxDecoration(
      //               border: Border.all(color: Colors.black87)
      //             ),
      //             child: Column(
      //               children: [
      //                 Expanded(
      //                   flex: 3,
      //                   child: Container(
      //                     height: 100,
      //                     color: primaryColor,
      //                   ),
      //                 ),
      //                 Expanded(
      //                   flex: 2,
      //                   child: Container(
      //                     height: 100,
      //                     color: Colors.white,
                          
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //           Container(
      //             padding: const EdgeInsets.only(right: 21, left: 21, top: 15, bottom: 15),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                      const Icon(Icons.menu_sharp, color: Colors.white,),
      //                       Row(
      //                         children: const [
      //                         Text("Canada, Ottawa", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white),),
      //                         SizedBox(width: 10,),
      //                         Icon(Icons.keyboard_arrow_down, color: Colors.white,),
      //                       ],),
      //                        const CircleAvatar(
      //                         backgroundColor: Colors.white,
      //                         radius: 15,
      //                         child: Icon(Icons.person,color: Colors.grey,),
      //                       ),
                            
      //                     ],
      //                   ),
      //                 const SizedBox(height: 20),
      //                 const Text(
      //                 "Popular Sweet",
      //                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700 ,color: Colors.white),
      //                 ),
      //                 const SizedBox(height: 20),
      //                 // ListView(
      //                 //   scrollDirection: Axis.horizontal,
      //                 //   children:[
      //                 //      Container(
      //                 //     height: 200,
      //                 //     width: MediaQuery.of(context).size.width * 0.8,
      //                 //     decoration: BoxDecoration(
      //                 //       borderRadius: BorderRadius.circular(8),
      //                 //       color: Colors.white,
      //                 //       border: Border.all(color: Colors.grey)
      //                 //     ),
      //                 //     child: Container()
      //                 //     ,
      //                 //   ),
      //                 //   ]
      //                 // )
      //               ],
      //             ),
      //           )
      //         //    Container(
      //         //   height: 180,
      //         //   padding: const EdgeInsets.only(right: 21, left: 21, top: 15, bottom: 15),
      //         //   color: primaryColor,
      //         //   child: Column(
      //         //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         //     crossAxisAlignment: CrossAxisAlignment.start,
      //         //     children: [
      //         //       Row(
      //         //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         //         crossAxisAlignment: CrossAxisAlignment.start,
      //         //         children: [
      //         //          const Icon(Icons.menu_sharp, color: Colors.white,),
      //         //           Row(
      //         //             children: const [
      //         //             Text("Canada, Ottawa", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white),),
      //         //             SizedBox(width: 10,),
      //         //             Icon(Icons.keyboard_arrow_down, color: Colors.white,),
      //         //           ],),
      //         //            const CircleAvatar(
      //         //             backgroundColor: Colors.white,
      //         //             radius: 15,
      //         //             child: Icon(Icons.person,color: Colors.grey,),
      //         //           ),
                        
      //         //         ],
      //         //       ),
      //         //       const SizedBox(height: 20),
      //         //       const Text(
      //         //       "Popular Sweet",
      //         //       style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700 ,color: Colors.white),
      //         //       ),
      //         //       const SizedBox(height: 20),
      //         //       Container(
      //         //         height: 100,
      //         //         width: MediaQuery.of(context).size.width * 0.8,
      //         //         decoration: BoxDecoration(
      //         //           borderRadius: BorderRadius.circular(8),
      //         //           color: Colors.white,
      //         //         ),
      //         //         child: Container()
      //         //         ,
      //         //       )
      //         //     ],
      //         //   ),
      //         // ),
      //         ]
      //       ),
      //       const SizedBox(height: 20),
      //       Container(
      //         padding: const EdgeInsets.only(right: 18, left: 18),
      //         child: Card(
      //           elevation: 0.2,
      //           child: Container(
      //             height: 35,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(5),
      //               // border: Border.all(color: Colors.black12, width: 1)
      //             ),
      //             child: Padding(
      //               padding: const EdgeInsets.symmetric(horizontal:8.0),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //               Container(
      //                 child: Row(
      //                   children: const [
      //                   Icon(Icons.search, color: Colors.black38),
      //                   SizedBox(width: 10,),
      //                   Text("Search", style: TextStyle(color: Colors.black38),)
      //                 ],),
      //               ),
      //               const Icon(Icons.filter_alt, color: Colors.black38,),
      //           ],),
      //             ),),
      //         ),
      //       ),
      //       const SizedBox(height: 20),
      //       BuildBigBanner(context),
      //       // const SizedBox(height: 9),.
      //       const SizedBox(height: 20),
            // BuildScrolView(context)
      //     ],
      //   ),
      //   // BuildBottomBar(context),
      // ]),
    )
    );
  }

}
