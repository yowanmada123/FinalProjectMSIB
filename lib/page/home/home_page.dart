import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/Repository.dart';
import 'package:resto_mobile/data/data_product.dart';
import 'package:resto_mobile/data/model.dart';
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
  late Future<List<Products>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = repository.fetchAlbum();
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

              ]
              ), itemExtent: 30,
            ), 
            SliverFixedExtentList(
              itemExtent: 150,
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      height: 130,
                      width: Get.width,
                      child: Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: allData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemWidgetCategory(
                              product: allData[index],
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ]),
            ),
            SliverFixedExtentList(
              delegate: SliverChildListDelegate([
                const Padding(
                  padding: EdgeInsets.only(left: 23.0, top: 5),
                  child: Text(
                    "Popular Sweet",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
              itemExtent: 30,
            ),
            SliverFixedExtentList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: FutureBuilder<List<Products>>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Products> listProducts = snapshot.data!;
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 200,
                          ),
                          itemCount: listProducts.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              height: 250,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    child: Container(
                                      height: 100,
                                      child: Image.network(
                                        listProducts[index].image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    listProducts[index].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    listProducts[index].harga.toString(),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ]),
              itemExtent: 1300,
            ),
          ],
        )
    )
    );
  }

  Widget BuildVerticalItem() {
    return GestureDetector(
      onTap: (){
        Get.to(DetailProductPage(product: allData[0],));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical:10.0),
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/morefood1.jpg",
                      // profileImage,
                      width: 90,
                      height: 90,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ahmad Ali Jabir",
                        // name,
                        style: TextStyle(color: Colors.black87, fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          // const Icon(IconData(0xf518, fontFamily: 'MaterialIcons')),
                          Icon(
                            Icons.location_on_outlined,
                            size: 15,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "78th Street. 88 W 21th St, NY",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[400],
                              // decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          // const Icon(IconData(0xf518, fontFamily: 'MaterialIcons')),
                          Icon(
                            Icons.timelapse_rounded,
                            size: 15,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "4 min . 1.5 km",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[400],
                              // decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: OsecondaryColor,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: OsecondaryColor,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: OsecondaryColor,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: OsecondaryColor,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: OsecondaryColor,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "(5.0)",
                            // star,
                            style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // TryItemWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class TryItemWidget extends StatelessWidget {
  const TryItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: (){
              Get.to(DetailProductPage(product: allData[0],));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: 160,
              height: 176,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      // offset: Offset(0.0, 0.0), //(x,y)
                      blurRadius: 0.1,
                    ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                      width: Get.width,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.67),
                        image: const DecorationImage(
                          image: 
                          AssetImage("assets/images/morefood1.jpg"),
                          // AssetImage(product.image),
                          fit: BoxFit.fill,
                        ),
                        
                      ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const[
                       Text(
                        "Strawberry Cake",
                        // product.name,
                        style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                        width: 127,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8.67),
                        ),
                        child: const Center(
                          child: Text(
                            "\$15",
                            // '\$${product.finalprice}',
                            style:  TextStyle(
                                // decoration: TextDecoration.lineThrough,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54),
                          ),
                        ),
                      )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: (){
              Get.to(DetailProductPage(product: allData[2],));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: 160,
              height: 176,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      // offset: Offset(0.0, 0.0), //(x,y)
                      blurRadius: 0.1,
                    ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                      width: Get.width,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.67),
                        image: const DecorationImage(
                          image: 
                          AssetImage("assets/images/morefood3.jpg"),
                          // AssetImage(product.image),
                          fit: BoxFit.fill,
                        ),
                        
                      ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Strawberry Cake",
                    // product.name,
                    style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Container(
                        width: 127,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8.67),
                        ),
                        child: const Center(
                          child: Text(
                            "\$15",
                            // '\$${product.finalprice}',
                            style:  TextStyle(
                                // decoration: TextDecoration.lineThrough,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54),
                          ),
                        ),
                      )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
