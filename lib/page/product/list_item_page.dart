import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/data_product.dart';
import 'package:resto_mobile/page/home/item_widget_favorite.dart';
import 'package:resto_mobile/page/home/item_widget_vertical.dart';
import 'package:resto_mobile/page/product/filter_page.dart';
import 'package:resto_mobile/utils/color.dart';

class ListItemPage extends StatelessWidget {
  const ListItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // title: "Product Category",
      // backgroundColor: Colors.white,
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // automaticallyImplyLeading: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            // pinned: true,
            expandedHeight: 75.0,
            // leading: Padding(
            //   padding: const EdgeInsets.only(top:16.0),
            //   child: IconButton(
            //     icon: const Icon(Icons.arrow_back_ios, color: Colors.black54,),
            //     tooltip: 'Add new entry',
            //     onPressed: () {
            //       Get.back();
            //     },
            //   ),
            // ),
            // actions: <Widget>[
            //   Padding(
            //     padding: const EdgeInsets.only(right:18.0, top: 16),
            //     child: Image.asset("assets/images/ic_filter.png", height: 30, width: 30,),
            //   ),
            // ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black54,
                      ),
                      tooltip: 'Add new entry',
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      height: 45.0,
                      width: Get.width * 0.7,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.text,
                        placeholder: 'Hamburger',
                        placeholderStyle: const TextStyle(
                          color: Color(0xffC4C6CC),
                          fontSize: 14.0,
                          fontFamily: 'Brutal',
                        ),
                        prefix: const Padding(
                          padding: EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                          child: Icon(
                            Icons.search,
                            color: Color(0xffC4C6CC),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[100],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                          onTap: () {
                            Get.to(const FilterPage());
                          },
                          child: Image.asset(
                            "assets/images/ic_filter.png",
                            height: 30,
                            width: 30,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
              itemExtent: 110,
              delegate: SliverChildListDelegate([
                const ItemWidgetVercital(),
                const ItemWidgetVercital(),
                const ItemWidgetVercital(),
                const ItemWidgetVercital(),
                const ItemWidgetVercital(),
                const ItemWidgetVercital(),
                const ItemWidgetVercital(),
                const ItemWidgetVercital(),
                const ItemWidgetVercital(),
                const ItemWidgetVercital(),
                const ItemWidgetVercital(),
                const ItemWidgetVercital(),
                // Stack(
                //   children: [
                //     SizedBox(
                //       height: 260,
                //       width: Get.width,
                //       child: Column(
                //         children: [
                //           Expanded(
                //             flex: 2,
                //             child: Container(
                //               height: 100,
                //               color: primaryColor,
                //             ),
                //           ),
                //           Expanded(
                //             flex: 2,
                //             child: Container(
                //               height: 20,
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //     Positioned(
                //       top:10,
                //       left:23,
                //       right: 23,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: const [
                //           Text(
                //           "Tranding Cake",
                //           style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700 ,color: Colors.white),
                //           ),
                //           Text(
                //           "See all(12)",
                //           style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400 ,color: Colors.white),
                //           ),
                //         ],
                //       ),
                //     ),
                //     Positioned(
                //       top: 50,
                //       child: Container(
                //         padding: const EdgeInsets.only(left: 16),
                //         height: 200,
                //         width: Get.width,
                //         // decoration: BoxDecoration(
                //         //   border: Border.all(color: Colors.black)
                //         // ),
                //         child: Expanded(
                //           child: ListView.builder(
                //             scrollDirection: Axis.horizontal,
                //             itemCount: allData.length,
                //             itemBuilder: (BuildContext context, int index) {
                //               return ItemWidgetFavorite(product: allData[index],);
                //             }
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ])),
        ],
      )
          // SingleChildScrollView(
          //   child:
          //   Column(
          //     children: const [

          //       ItemWidgetVercital(),
          //       ItemWidgetVercital(),
          //       ItemWidgetVercital(),
          //       ItemWidgetVercital(),
          //       ItemWidgetVercital(),
          //       ItemWidgetVercital(),
          //       ItemWidgetVercital(),
          //       ItemWidgetVercital(),
          //       ItemWidgetVercital(),
          //       ItemWidgetVercital(),
          //       ItemWidgetVercital(),
          //       ItemWidgetVercital(),
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
