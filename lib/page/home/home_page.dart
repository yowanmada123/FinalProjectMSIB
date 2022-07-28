import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_mobile/widget/big_banner.dart';
import 'package:resto_mobile/widget/line.dart';
import 'package:resto_mobile/widget/scrool_view.dart';
import 'package:resto_mobile/widget/top_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(MainController());
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
        ListView(
          padding: const EdgeInsets.only(right: 21, left: 21, top: 15),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 226, 156, 239),
                  radius: 15,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
                Row(
                  children: [
                  Text("Canada, Ottawa", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black54),),
                  SizedBox(width: 10,),
                  Icon(Icons.keyboard_arrow_down, color: Colors.black54,),
                  
                ],),
                Icon(Icons.menu_sharp, color: Colors.black54,)
              ],
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 0.2,
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // border: Border.all(color: Colors.black12, width: 1)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Container(
                    child: Row(
                      children: [
                      Icon(Icons.search, color: Colors.black38),
                      SizedBox(width: 10,),
                      Text("Search", style: TextStyle(color: Colors.black38),)
                    ],),
                  ),
                  Icon(Icons.filter_alt, color: Colors.black38,),
              ],),
                ),),
            ),
            const SizedBox(height: 20),
            BuildBigBanner(context),
            // const SizedBox(height: 9),.
            const SizedBox(height: 20),
            BuildScrolView(context)
          ],
        ),
        // BuildBottomBar(context),
      ]),
    ));
  }
}
