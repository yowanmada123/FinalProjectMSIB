import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/widget/base/form/form_scaffold.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  bool isPesanAntar = true;

  @override
  Widget build(BuildContext context) {
    return OScaffold(
      title: "History Order",
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                  child: Text(
                    "History Pesanan",
                    style: TextStyle(color: Color.fromARGB(221, 36, 36, 36), fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 0.1,
                ),
                SizedBox(
                  height: 20,
                ),
                BuildItem(
                  judul: "Taki_id, Pacet",
                  orderStatus: "Delivered",
                  time: "28 Jun 13.08",
                ),
                BuildItem(
                  judul: "Taki_id, Pacet",
                  orderStatus: "Delivered",
                  time: "28 Jun 13.08",
                ),
                BuildItem(
                  judul: "Sat Ayam Njan, Benowo",
                  orderStatus: "Tidak dapat driver",
                  time: "28 Jun 18.58",
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class BuildItem extends StatelessWidget {
  final String judul;
  final String orderStatus;
  final String time;

  const BuildItem({Key? key, required this.judul, required this.orderStatus, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.00, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(color: Color(0xffC5F0EF), borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.food_bank,
                    color: Color(0xffDD1138),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      judul,
                      style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // time,
                      orderStatus,
                      style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // time,
                      time,
                      style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
