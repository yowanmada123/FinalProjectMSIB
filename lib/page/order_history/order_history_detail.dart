import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/base/form/form_scaffold.dart';

class OrderHistoryDetailPage extends StatefulWidget {
  const OrderHistoryDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderHistoryDetailPage> createState() => _OrderHistoryDetailPageState();
}

class _OrderHistoryDetailPageState extends State<OrderHistoryDetailPage> {
  bool isPesanAntar = true;

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
                  icon: const Icon(Icons.arrow_back),
                  tooltip: 'Add new entry',
                  onPressed: () {},
                ),
              // actions: <Widget>[
              //   IconButton(
              //     icon: const Icon(Icons.search, color: Colors.white,),
              //     tooltip: 'Add new entry',
              //     onPressed: () {},
              //   ),
              // ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                      Text("Detail History", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white),),
                     
                      ],
                    ),
                ),
                ),
              ),
            SliverFixedExtentList(
              itemExtent:  MediaQuery.of(context).size.height,
              delegate: SliverChildListDelegate(
                [
                  Stack(
                    children: [
                      SizedBox(
                        height: 260,
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.black87
                        //   )
                        // ),
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
                        top: 10,
                        left: MediaQuery.of(context).size.width*0.05,
                        child: Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width*0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor,
                                  blurRadius: 0.1,
                                  spreadRadius: 0.1,
                                  // offset: Offset(0, 10),
                                ),
                              ],
                              // border: Border.all(color: Colors.black),
                              // borderRadius: BorderRadius.circular(15)
                              ),
                          ),
                        ),
                      )
                    ],
                  ),
                ]
              )
            ),
            // SliverFixedExtentList(
            //   delegate: SliverChildListDelegate(
            //     [
                
            //   ]), itemExtent: 25,
            // ),     
            // SliverFixedExtentList(
            //   delegate: SliverChildListDelegate(
            //     [
                
            //   ]), itemExtent: 400,
            // ),
          ],
        )
    )
    );
  }
}

