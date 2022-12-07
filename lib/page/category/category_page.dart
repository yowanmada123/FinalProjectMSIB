import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/model_category.dart';
import 'package:resto_mobile/page/product/filter_page.dart';
import 'package:resto_mobile/page/product/list_item_page.dart';
import 'package:resto_mobile/utils/color.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListCategoryPage extends StatefulWidget {
  const ListCategoryPage({Key? key}) : super(key: key);

  @override
  State<ListCategoryPage> createState() => _ListCategoryPageState();
}

Future<List<AllCategory>> getCategory() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  final response = await http.get(
      Uri.parse(
        'https://api1.sib3.nurulfikri.com/api/category/',
      ),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${pref.getString('token')}',
        HttpHeaders.contentTypeHeader: 'application/json',
      });

  if (response.statusCode == 200) {
    List responseJson = (json.decode(response.body))['data'];
    print(responseJson);
    return responseJson.map((data) => AllCategory.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class _ListCategoryPageState extends State<ListCategoryPage> {
  late Future<List<AllCategory>> futureAlbume;

  @override
  void initState() {
    super.initState();
    futureAlbume = getCategory();
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
                          placeholder: 'Category',
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
            FutureBuilder<List<AllCategory>>(
              future: futureAlbume,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<AllCategory> allCategory = snapshot.data!;
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: GestureDetector(
                              onTap: () => Get.to(ListItemPage(
                                  id: allCategory[index].id.toString())),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                height: 60,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      offset: Offset(2.0, 3.0), //(x,y)
                                      blurRadius: 0.1,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  allCategory[index].name.capitalize.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: OprimaryColor),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: allCategory.length,
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
