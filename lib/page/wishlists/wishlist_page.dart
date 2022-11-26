import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/Repository.dart';
import 'package:resto_mobile/data/model_category.dart';
import 'package:resto_mobile/data/model_products.dart';
import 'package:resto_mobile/data/model_wishlists.dart';
import 'package:resto_mobile/page/home/widget/item_widget_vertical.dart';
import 'package:resto_mobile/page/product/filter_page.dart';
import 'package:resto_mobile/page/wishlists/item_widget.dart';
import 'package:resto_mobile/utils/color.dart';

class WishlistsPage extends StatefulWidget {
  const WishlistsPage({Key? key}) : super(key: key);

  @override
  State<WishlistsPage> createState() => _ListItemPageState();
}

class _ListItemPageState extends State<WishlistsPage> {
  Repository repository = Repository();
  late Future<List<Wishlists>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = repository.getWishlists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              expandedHeight: 75.0,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
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
            FutureBuilder<List<Wishlists>>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Wishlists> dataItem = snapshot.data!;
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
                          return ItemWidget(product: dataItem[index]);
                        },
                        childCount: dataItem.length,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return SliverPadding(
                    padding: const EdgeInsets.all(100),
                    sliver: SliverToBoxAdapter(
                      child: Text("${snapshot.error}"),
                    ),
                  );
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
