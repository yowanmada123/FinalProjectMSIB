import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/Repository.dart';
import 'package:resto_mobile/data/data_product.dart';
import 'package:resto_mobile/data/model_category.dart';
import 'package:resto_mobile/data/model_products.dart';
import 'package:resto_mobile/page/cart/cart_page.dart';
import 'package:resto_mobile/page/category/category_page.dart';
import 'package:resto_mobile/page/wishlists/wishlist_page.dart';
import 'package:resto_mobile/utils/color.dart';

import 'widget/item_widget_category.dart';
import 'widget/item_widget_favorite.dart';
import 'widget/item_widget_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository repository = Repository();
  late Future<List<Products>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = repository.getProdacts();
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
                IconButton(
                  icon: const Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                  ),
                  tooltip: 'Add new entry',
                  onPressed: () => Get.to(const WishlistsPage()),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.white,
                  ),
                  tooltip: 'Add new entry',
                  onPressed: () {
                    Get.to(CartPage());
                  },
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
                            onTap: () => Get.to(ListCategoryPage()),
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
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Products> dataItem = snapshot.data!;
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
                          return ItemWidgetProduct(product: dataItem[index]);
                        },
                        childCount: dataItem.length,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return SliverPadding(
                    padding: const EdgeInsets.all(100),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                offset: const Offset(2.0, 3.0), //(x,y)
                                blurRadius: 0.1,
                              ),
                            ],
                          ),
                          height: 100,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.error_rounded,
                              color: OprimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return SliverPadding(
                  padding: const EdgeInsets.all(100),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(2.0, 3.0), //(x,y)
                              blurRadius: 0.1,
                            ),
                          ],
                        ),
                        height: 60,
                        width: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircularProgressIndicator(
                            color: OprimaryColor,
                          ),
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
