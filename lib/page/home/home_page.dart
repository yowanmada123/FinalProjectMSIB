import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/data_product.dart';
import 'package:resto_mobile/page/home/item_widget_category.dart';
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
      body: SafeArea(
      child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: primaryColor,
              pinned: false,
              expandedHeight: 50.0,
              leading: IconButton(
                  icon: const Icon(Icons.menu),
                  tooltip: 'Add new entry',
                  onPressed: () {},
                ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white,),
                  tooltip: 'Add new entry',
                  onPressed: () {},
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                      Text("Canada, Ottawa", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white),),
                      SizedBox(width: 10,),
                      Icon(Icons.keyboard_arrow_down, color: Colors.white,),
                      ],
                    ),
                ),
                ),
              ),
            SliverFixedExtentList(
              itemExtent: 250,
              delegate: SliverChildListDelegate(
                [
                  Stack(
                    children: [
                      SizedBox(
                        height: 260,
                        width: Get.width,
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
                                height: 20,
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
                          width: Get.width,
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
                ]
              )
            ),
            SliverFixedExtentList(
              delegate: SliverChildListDelegate(
                [
                const Padding(
                  padding:EdgeInsets.only(left:23.0,top: 5),
                  child: Text(
                        "Category",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700 ,color: Colors.black),
                        ),
                ),
              ]), itemExtent: 30,
            ), 
            SliverFixedExtentList(
              itemExtent: 130,
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    height: 200,
                    width: Get.width,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: allData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemWidgetCategory(product: allData[index],);
                        }
                      ),
                    ),
                  ),
                ]
              )
            ),
            SliverFixedExtentList(
              delegate: SliverChildListDelegate(
                [
                const Padding(
                  padding:EdgeInsets.only(left:23.0,top: 5),
                  child: Text(
                        "Popular Sweet",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700 ,color: Colors.black),
                        ),
                ),
              ]), itemExtent: 30,
            ),     
            SliverFixedExtentList(
              delegate: SliverChildListDelegate(
                [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
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
              ]), itemExtent: 400,
            ),
          ],
        )
    )
    );
  }

}
