import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/Repository.dart';
import 'package:resto_mobile/data/model_history.dart';
import 'package:resto_mobile/page/order_history/order_history_detail.dart';
import 'package:resto_mobile/utils/color.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  Repository repository = Repository();
  late Future<List<BuyHostory>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = repository.getBuyHistorys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Order"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: OprimaryColor,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder<List<BuyHostory>>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<BuyHostory> dataItem = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return BuildItem(buyHostory: dataItem[index]);
                  },
                  itemCount: dataItem.length,
                ),
              );
            } else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(100),
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
                      child: Icon(
                        Icons.error_rounded,
                        color: OprimaryColor,
                      ),
                    ),
                  ),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(100),
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
            );
          },
        ),
      ),
    );
  }
}

class BuildItem extends StatefulWidget {
  const BuildItem({Key? key, required this.buyHostory}) : super(key: key);

  final BuyHostory buyHostory;
  @override
  State<BuildItem> createState() => _BuildItemState();
}

class _BuildItemState extends State<BuildItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(OrderHistoryDetailPage(
          buyHistory: widget.buyHostory,
        ));
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
                    widget.buyHostory.dateOrder,
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
                          child:
                              Image.network(widget.buyHostory.products[0].image)
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
                                widget.buyHostory.alamat,
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
                          // Text(
                          //   // time,
                          //   widget.buyHostory.status,
                          //   style: const TextStyle(
                          //       color: Colors.grey,
                          //       fontSize: 13,
                          //       fontWeight: FontWeight.w500),
                          // ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Rp. ${widget.buyHostory.total.toString()}",
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            // time,
                            "${widget.buyHostory.products.length} Pesanan",
                            style: const TextStyle(
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
                  Text(
                    widget.buyHostory.status,
                    style: const TextStyle(
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
