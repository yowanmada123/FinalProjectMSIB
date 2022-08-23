import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/data_product.dart';
import 'package:resto_mobile/page/home/item_widget_category.dart';
import 'package:resto_mobile/page/home/item_widget_favorite.dart';
import 'package:resto_mobile/page/home/item_widget_product.dart';
import 'package:resto_mobile/page/home/item_widget_vertical.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/base/form/form_scaffold.dart';
import 'package:resto_mobile/widget/big_banner.dart';
import 'package:resto_mobile/widget/scrool_view.dart';

class ListItemPage extends StatelessWidget {
  const ListItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OScaffold(
      title: "Product Category",
      backgroundColor: Colors.white,
      body: SafeArea(child: 
      SingleChildScrollView(
        child: Column(
          children: const [
            ItemWidgetVercital(),
            ItemWidgetVercital(),
            ItemWidgetVercital(),
            ItemWidgetVercital(),
            ItemWidgetVercital(),
            ItemWidgetVercital(),
            ItemWidgetVercital(),
            ItemWidgetVercital(),
            ItemWidgetVercital(),
            ItemWidgetVercital(),
            ItemWidgetVercital(),
            ItemWidgetVercital(),
          ],
      ),),),
    );
  }

}
