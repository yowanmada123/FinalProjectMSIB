import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/order_history/order_history_detail.dart';
import 'package:resto_mobile/utils/color.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("History Order"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: OprimaryColor,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
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

  const BuildItem(
      {Key? key,
      required this.judul,
      required this.orderStatus,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const OrderHistoryDetailPage());
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.00, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(10)
            border: Border(
              bottom: BorderSide(width: 10.0, color: Colors.grey.shade100),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "1151855485481518145",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xffC5F0EF),
                            // borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset("assets/images/cake_chocolate.png")
                          // const Icon(
                          //   Icons.food_bank,
                          //   color: Color(0xffDD1138),
                          // ),
                          ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.shield_moon,
                                color: Color(0xffDD1138),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                judul,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            // time,
                            orderStatus,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Rp. 85.000",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            // time,
                            "10 Pesanan",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
                height: 0.1,
                thickness: 0.1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Selesai",
                    style: TextStyle(
                        color: Color.fromARGB(255, 38, 38, 38),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 25,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.00, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.circular(10)
                            border: Border.all(color: OprimaryColor)),
                        child: Center(
                            child: Text(
                          "Beri Penilaian",
                          style: TextStyle(
                              color: OprimaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 100,
                        height: 25,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.00, vertical: 5),
                        decoration: BoxDecoration(
                            color: OprimaryColor,
                            // borderRadius: BorderRadius.circular(10)
                            border: Border.all(
                              color: OprimaryColor,
                            )),
                        child: const Center(
                            child: Text(
                          "Pesan lagi",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}
