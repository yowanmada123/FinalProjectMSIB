import 'package:flutter/material.dart';
import 'package:resto_mobile/widget/item_widget_product.dart';

import 'item_widget.dart';

// ignore: non_constant_identifier_names
Widget BuildScrolView(BuildContext context) {
    return SizedBox(
          height: 460,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(left:2.0),
                child: Text(
                  "Popular Sweet",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700 ,color: Colors.black54),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  ItemWidgetSecond(
                      name: "Cerry Cake",
                      images: 'assets/images/cake_cupcake.svg',
                      warna: Color(0xffCAE7BC),
                      firstprice: "90.000",
                      finalprice: "45.000",),
                  SizedBox(width: 20),
                  ItemWidget(
                    name: "Cup Cake",
                      images: 'assets/images/cake_cupcake.svg',
                      warna: Color(0xffD4F0FE),
                      firstprice: "350.000",
                      finalprice: "185.800",),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  ItemWidget(
                    name: "My Donuts",
                      images: 'assets/images/cake_donut.svg',
                      warna: Color(0xffFFDBD3),
                      firstprice: "8.800.000",
                      finalprice: "8.200.000",),
                  SizedBox(width: 20),
                  ItemWidget(
                    name: "Cerry Cake",
                      images: 'assets/images/cake_cerry.svg',
                      warna: Color(0xffCAE7BC),
                      firstprice: "3.000.000",
                      finalprice: "2.500.000",),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  ItemWidget(
                    name: "Blueberry",
                      images: 'assets/images/cake_blueberry.svg',
                      warna: Color(0xffFFF7D5),
                      firstprice: "8.200.000",
                      finalprice: "4.500.000",),
                  SizedBox(width: 20),
                  ItemWidget(
                    name: "Birthday Cake",
                      images: 'assets/images/cake_bithday.svg',
                      warna: Color(0xffCAE7BC),
                      firstprice: "3.200.000",
                      finalprice: "2.000.000",),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  ItemWidget(
                    name: "Blueberry Cake",
                      images: 'assets/images/cake_blueberry.svg',
                      warna: Color(0xffC5F0EF),
                      firstprice: "9.000.000",
                      finalprice: "4.500.000",),
                  SizedBox(width: 20),
                  ItemWidget(
                    name: "Slice Cake",
                      images: 'assets/images/cake_slice.svg',
                      warna: Color(0xffCAE7BC),
                      firstprice: "3.200.000",
                      finalprice: "2.500.000",),
                ],
              ),
              const SizedBox(height: 80),
            ],
          ),
        );
  }