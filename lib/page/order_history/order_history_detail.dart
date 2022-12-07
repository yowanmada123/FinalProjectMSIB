import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/model_history.dart';
import 'package:resto_mobile/page/order_history/timeline_page.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/base/form/form_scaffold.dart';

class OrderHistoryDetailPage extends StatefulWidget {
  const OrderHistoryDetailPage({
    Key? key,
    required this.buyHistory,
  }) : super(key: key);

  final BuyHostory buyHistory;
  @override
  State<OrderHistoryDetailPage> createState() => _OrderHistoryDetailPageState();
}

class _OrderHistoryDetailPageState extends State<OrderHistoryDetailPage> {
  final int costOrder = 15000;
  final int costService = 3000;

  @override
  Widget build(BuildContext context) {
    print(widget.buyHistory.products);
    return OScaffold(
      title: "Order Detail",
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/images/people.png",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Chabib Saiful Arif (Driver)",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 15,
                                    ),
                                    const Text(
                                      "5.0",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "L578621",
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.call,
                              color: Colors.grey,
                              size: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.message,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(width: 0.3, color: Colors.grey))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "NF CONMPUTER STORE",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Rp. ${widget.buyHistory.total} - ${widget.buyHistory.products.length} pesanan",
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Nama Pelanggan - (+62) 822-3353-2267",
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Alamat Penerima",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.buyHistory.alamat,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(width: 0.3, color: Colors.grey))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "List Pesanan",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 300,
                      width: Get.width,
                      child: ListView.builder(
                          itemCount: widget.buyHistory.products.length,
                          itemBuilder: (context, index) {
                            return BuildItemBuyed(
                              itemOrder: widget.buyHistory.products[index],
                            );
                          }),
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         decoration: const BoxDecoration(
                    //             border: Border(
                    //                 top: BorderSide(
                    //                     width: 0.3, color: Colors.grey),),),
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     Row(
                    //       children: const [
                    //         Text(
                    //           "Lihat Lebih Banyak ",
                    //           style: TextStyle(
                    //               color: Colors.grey,
                    //               fontSize: 15,
                    //               fontWeight: FontWeight.w500),
                    //         ),
                    //         Icon(
                    //           Icons.keyboard_arrow_down,
                    //           color: Colors.grey,
                    //           size: 15,
                    //         ),
                    //       ],
                    //     ),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     Expanded(
                    //       child: Container(
                    //         decoration: const BoxDecoration(
                    //             border: Border(
                    //                 top: BorderSide(
                    //                     width: 0.3, color: Colors.grey))),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total (${widget.buyHistory.products.length} Pesanan)",
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Rp. ${widget.buyHistory.total}",
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(width: 0.3, color: Colors.grey))),
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
                              "Biaya Pengiriman ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                            Icon(
                              Icons.info_outline,
                              color: Colors.grey,
                              size: 15,
                            ),
                          ],
                        ),
                        Text(
                          "Rp. ${costOrder.toString()}",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
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
                              "Biaya Layanan ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                            Icon(
                              Icons.info_outline,
                              color: Colors.grey,
                              size: 15,
                            ),
                          ],
                        ),
                        Text(
                          "Rp. ${costService.toString()}",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Rp. ${widget.buyHistory.total + costService + costOrder}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Sudah termasuk pajak",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 0.3, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Rincian ",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
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
                          "Catatan",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "Tidak ada",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Nomer Pemesanan",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "84847474584847477",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Waktu Pemesanan",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          widget.buyHistory.dateOrder,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
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
                          "Pembayaran",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "CakePay",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            // width: 100,
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.00, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: OsecondaryColor)),
                            child: Center(
                              child: Text(
                                "Beri Penilaian",
                                style: TextStyle(
                                    color: OsecondaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            // width: 100,
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.00, vertical: 5),
                            decoration: BoxDecoration(
                              color: OsecondaryColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: OsecondaryColor,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Pesan lagi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildItemBuyed extends StatefulWidget {
  const BuildItemBuyed({
    Key? key,
    required this.itemOrder,
  }) : super(key: key);

  final ItemOrder itemOrder;
  @override
  State<BuildItemBuyed> createState() => _BuildItemBuyedState();
}

class _BuildItemBuyedState extends State<BuildItemBuyed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: const Offset(2.0, 3.0), //(x,y)
              blurRadius: 0.1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.itemOrder.image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${widget.itemOrder.pivot.qty} x",
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 180,
                                    child: Text(
                                      widget.itemOrder.name,
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                     overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rp. ${widget.itemOrder.harga}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
