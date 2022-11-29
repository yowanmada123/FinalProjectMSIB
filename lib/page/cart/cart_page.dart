import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/model_chart.dart';
import 'package:resto_mobile/global_controller.dart';
import 'package:resto_mobile/page/cart/change_address.dart';
import 'package:resto_mobile/page/cart/map_page.dart';
import 'package:resto_mobile/page/cart/route_page.dart';
import 'package:resto_mobile/page/cart/success_payment.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/base/form/form_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../data/Repository.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isPesanAntar = true;
  Repository repository = Repository();
  late Future<List<Chart>> futureChart;
  late Future<List<Chart>> futurePayment;
  final gstate = Get.put(GlobalController());

  @override
  void initState() {
    super.initState();
    futureChart = repository.getCharts();
  }

  @override
  Widget build(BuildContext context) {
    return OScaffold(
      title: "Ananda Bakery, Benowo",
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        isPesanAntar == false
                            ? BuildAmbilDirumahView(context)
                            : BuildPesanAntarView(context),
                        const SizedBox(
                          height: 20,
                        ),
                        const Opacity(
                          opacity: 1,
                          child: Divider(
                            color: Colors.grey,
                            height: 0.1,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        isPesanAntar == false
                            ? BuildOptionOrder(
                                context,
                                const Icon(
                                  Icons.home_work,
                                  color: Colors.white,
                                ),
                                "Take Away",
                                "Pick Up in 1 hour")
                            : BuildOptionOrder(
                                context,
                                const Icon(
                                  Icons.delivery_dining,
                                  color: Colors.white,
                                ),
                                "Delivery Order",
                                "Will be delivered at +-3 days after"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 0.1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300,
                    width: Get.width,
                    child: FutureBuilder<List<Chart>>(
                      future: futureChart,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Chart> dataItem = snapshot.data!;
                          // for (var n = 0; n <= dataItem.length;n++) {
                          //   gstate.totalPayment.value = gstate.totalPayment.value + dataItem[n].product.harga;
                          // }
                          print(dataItem.length);
                          print("========================================");
                          if (dataItem.length == 1) {
                            return Center(
                              child: BuildItem(item: dataItem[0]),
                            );
                          } else {
                            return ListView.builder(
                                itemCount: dataItem.length,
                                itemBuilder: (BuildContext context, int index) {
                                  print(gstate.totalPayment.value);
                                  return BuildItem(
                                    item: dataItem[index],
                                  );
                                });
                          }
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Center(
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
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 0.1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BuildTambahPesanan(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 0.1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BuildPembayaranMethod(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 0.1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Total Payment",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 100,
                              width: Get.width,
                              child: FutureBuilder<List<Chart>>(
                                future: futureChart,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<Chart> dataItem = snapshot.data!;
                                    print(dataItem.length);
                                    print(
                                        "========================================");
                                    return ListView.builder(
                                        itemCount: dataItem.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 180,
                                                        child: Text(
                                                          dataItem[index]
                                                              .product
                                                              .name,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black87,
                                                              fontSize: 14),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Text(
                                                        "x1",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        dataItem[index]
                                                            .product
                                                            .harga
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black87,
                                                            fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          );
                                        });
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            offset:
                                                const Offset(2.0, 3.0), //(x,y)
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
                                  );
                                },
                              ),
                            ),
                            Divider(),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      "Shipping cost",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "x1",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "85000",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Service charge & more",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                ),
                                Text(
                                  "5000",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Discount",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                ),
                                Text(
                                  "-19000",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 0.1,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total Payment",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Obx(() => Text(
                                      "Rp. ${gstate.totalPayment.value}",
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 0.1,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "View Details",
                                  style: TextStyle(
                                      color: OprimaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Icon(Icons.arrow_circle_right_sharp,
                                    color: OprimaryColor)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // const BuildTotalBayar(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          BuildBottomButton(context),
        ]),
      ),
    );
  }

  Widget BuildPesanAntarView(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ChangeAddressPage());
      },
      child: Container(
        width: Get.width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 0.5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: SizedBox(
                      height: 80,
                      child: Center(
                        child: Image.asset(
                          "assets/images/map.PNG",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Delivery Address",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(
                        () => Text(
                          gstate.address.toString(),
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Icon(Icons.arrow_forward_ios_outlined),
            ],
          ),
        ),
      ),
    );
  }

  Container BuildAmbilDirumahView(BuildContext context) {
    return Container(
      width: Get.width,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 0.5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const MapPage());
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: SizedBox(
                      height: 80,
                      child: Center(
                        child: Image.asset(
                          "assets/images/map.PNG",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Keputih Sari No. 57 Surabaya",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "238 Km",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container BuildPembayaranMethod() {
    return Container(
      height: 35,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.money),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Payment method")
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Choose Payment"),
                          Text("Method"),
                        ],
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Positioned BuildBottomButton(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      left: 16,
      child: GestureDetector(
        onTap: () {
          createTransaksi(context);
        },
        child: Container(
          width: Get.width,
          height: 50,
          decoration: BoxDecoration(
              color: OprimaryColor,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 229, 229, 229),
                  offset: Offset(-0.0, -0.2), //(x,y)
                ),
              ],
              // border: Border.all(color: Colors.grey, width: 0.5)    ,
              borderRadius: BorderRadius.circular(25)),
          child: const Center(
            child: Text(
              "Order Now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row BuildOptionOrder(
      BuildContext context, Icon icon, String option, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: OprimaryColor, child: icon,
              // Icon(icon),
              // Icon(
              //   Icons.home_work,
              //   color: Color(0xffDD1138),
              // ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  option,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  time,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () async {
            BuildModalOptionOrder(context);
            setState(() {});
          },
          child: Container(
              height: 20,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: OsecondaryColor, width: 0.5)),
              child: Center(
                  child: Text(
                "Ganti",
                style: TextStyle(
                    color: OsecondaryColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ))),
        ),
      ],
    );
  }

  Future<void> BuildModalOptionOrder(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
            height: 230,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.clear,
                                color: OsecondaryColor,
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "Change Delivery Option",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45,
                  width: Get.width,
                  color: Colors.grey[100],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Select Order Type",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isPesanAntar = true;
                    setState(() {});
                    Navigator.pop(context, true);
                  },
                  child: SizedBox(
                    height: 45,
                    width: Get.width,
                    // color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.delivery_dining_outlined,
                                color: OprimaryColor,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Delivery Order",
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          (isPesanAntar == true)
                              ? Icon(Icons.check)
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isPesanAntar = false;
                    setState(() {});
                    Navigator.pop(context, false);
                  },
                  child: SizedBox(
                    height: 45,
                    width: Get.width,
                    // color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.home_filled,
                                color: OprimaryColor,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Take Away",
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          (isPesanAntar == false)
                              ? Icon(Icons.check)
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  Padding BuildTambahPesanan() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Any Other Orders ?",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "You can still add another cake.",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          Container(
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: OsecondaryColor, width: 0.5)),
              child: Center(
                  child: Text(
                "Add",
                style: TextStyle(
                    color: OsecondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ))),
        ],
      ),
    );
  }
}

Future<void> createTransaksi(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final gstate = Get.put(GlobalController());
  var token = prefs.getString('token');
  print(token);

  try {
    final response = await http.post(
      Uri.parse('https://api1.sib3.nurulfikri.com/api/transaksi'),
      body: jsonEncode({
        "alamat": gstate.address.value,
      }),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    if (response.statusCode >= 200 && response.statusCode < 400) {
      print('Connection OK');
      print(response.body);
      final respStr = response.body;
      var body = jsonDecode(respStr);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Transaksi Sukses")));
      Get.offAll(const SuccessPayment());
    } else {
      // print('Connection Failed');
      print("Transaksi Gagal");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Transaksi Gagal")));
    }
  } catch (error) {
    print(error);
  }
}

class BuildTotalBayar extends StatelessWidget {
  const BuildTotalBayar({
    Key? key,
  }) : super(key: key);

  // final List<Chart> item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 0.5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total Payment",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Forest Garden",
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "x1",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "100.000",
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Shipping cost",
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "x1",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  const Text(
                    "3",
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Service charge & more",
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  Text(
                    "3.000",
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Discount",
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  Text(
                    "-19.000",
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.grey,
                height: 0.1,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total Payment",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "12.750",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.grey,
                height: 0.1,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "View Details",
                    style: TextStyle(
                        color: OprimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Icon(Icons.arrow_circle_right_sharp, color: OprimaryColor)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Chart item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Stack(
          children: [
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 250, 250, 250),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${item.product.name}",
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Rp. ${item.product.harga.toString()}",
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "x ${item.qty}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item.product.image,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 100,
                    ),
                    // Image.asset(
                    //   // image,
                    //   "assets/images/morefood3.jpg",
                    //   width: 100,
                    //   height: 100,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  //  const SizedBox(
                  //     height: 10,
                  //   ),
                  //   Text(
                  //     "\$$price",
                  //     style: const TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w500),
                  //   ),
                ],
              ),
            ),
          ],
        ));
  }
}
