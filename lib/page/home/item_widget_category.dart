import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/model_category.dart';
import 'package:resto_mobile/page/product/list_item_page.dart';

class ItemWidgetCategory extends StatelessWidget {
  const ItemWidgetCategory({required this.category, Key? key})
      : super(key: key);

  final CategoryDummy category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(ListItemPage(id: category.id.toString()));
        },
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.2), //(x,y)
                blurRadius: 0.1,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: SizedBox(
                  height: 100,
                  width: 120,
                  child: Center(
                    child: Image.asset(
                      category.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                category.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff6B5E5E),
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
