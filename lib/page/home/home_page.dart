import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/Repository.dart';
import 'package:resto_mobile/data/data_product.dart';
import 'package:resto_mobile/data/model_category.dart';
import 'package:resto_mobile/data/model_products.dart';
import 'package:resto_mobile/page/detailpage/detail_product_page.dart';
import 'package:resto_mobile/page/home/item_widget_category.dart';
import 'package:resto_mobile/page/home/item_widget_favorite.dart';
import 'package:resto_mobile/page/home/item_widget_product.dart';
import 'package:resto_mobile/utils/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository repository = Repository();
  late Future<List<Products>> futureProdacts;

  @override
  void initState() {
    super.initState();
    futureProdacts = repository.getProdacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: OprimaryColor,
              pinned: false,
              expandedHeight: 50.0,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                tooltip: 'Add new entry',
                onPressed: () {},
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
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
                      Text(
                        "Canada, Ottawa",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 250,
              delegate: SliverChildListDelegate([
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
                              color: OprimaryColor,
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
                      top: 10,
                      left: 23,
                      right: 23,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Tranding Cake",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Text(
                            "See all(12)",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
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
                                return ItemWidgetFavorite(
                                  product: allData[index],
                                );
                              }),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              sliver: SliverFixedExtentList(
                itemExtent: 220,
                delegate: SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Category",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "See all",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryDummy.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemWidgetCategory(
                                category: categoryDummy[index]);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "List Products",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            FutureBuilder<List<Products>>(
              future: futureProdacts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Products> allProducts = snapshot.data!;
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        mainAxisExtent: 200,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ItemWidgetProduct(product: allProducts[index]);
                        },
                        childCount: allProducts.length,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return SliverPadding(
                  padding: const EdgeInsets.all(100),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator(
                          color: OprimaryColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
