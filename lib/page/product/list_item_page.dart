import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/Repository.dart';
import 'package:resto_mobile/data/model_category.dart';
import 'package:resto_mobile/page/home/item_widget_vertical.dart';
import 'package:resto_mobile/page/product/filter_page.dart';
import 'package:resto_mobile/utils/color.dart';

late String idCategory;

class ListItemPage extends StatefulWidget {
  const ListItemPage({Key? key, required this.id}) : super(key: key);

  final String id;
  @override
  State<ListItemPage> createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  Repository repository = Repository();
  late Future<List<CategoryById>> productsCategory;

  @override
  void initState() {
    super.initState();
    productsCategory = repository.getCategory(widget.id);
  }

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
          FutureBuilder<List<CategoryById>>(
            future: productsCategory,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CategoryById> allProducts = snapshot.data!;
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
                        return ItemWidgetVercital(product: allProducts[index]);
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
