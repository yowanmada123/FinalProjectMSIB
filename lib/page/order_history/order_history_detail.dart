import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/order_history/timeline_page.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/base/form/form_scaffold.dart';
import 'package:timelines/timelines.dart';

class OrderHistoryDetailPage extends StatefulWidget {
  const OrderHistoryDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderHistoryDetailPage> createState() => _OrderHistoryDetailPageState();
}

class _OrderHistoryDetailPageState extends State<OrderHistoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return OScaffold(
       title: "Order Detail",
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                width: Get.width,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white, 
                // borderRadius: BorderRadius.circular(10)
                border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey.shade100),
                ),  
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:4.0),
                  child: ProcessTimelinePage(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 15),
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
                          child: Image.asset("assets/images/people.png", width: 50, height: 50, fit: BoxFit.cover,),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Chabib Saiful Arif (Driver)", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children:  [
                                const Icon(Icons.star, color: Colors.amber, size: 15,),
                                const Text("5.0", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration:  BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                 const SizedBox(
                                  width: 5,
                                ),
                                Text("L578621", style: TextStyle(color: Colors.grey[600], fontSize: 10, fontWeight: FontWeight.w500),),
                            ],),

                        ],),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.call, color: Colors.grey, size: 20,),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.message, color: Colors.grey, size: 20,),
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
                          top: BorderSide(width: 0.3, color: Colors.grey)
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Taki id - Benowo", style: TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500),),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Rp. 85.000 - 10 menu", style: TextStyle(color: Colors.grey, fontSize: 11),),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Nama Pelanggan - (+62) 822-3353-2267", style: TextStyle(color: Colors.grey, fontSize: 11),),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Alamat Penerima", style: TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500),),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Kendung Jaya VI No.88, Sukoharjo", style: TextStyle(color: Colors.grey, fontSize: 11),),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("SUKOHARJO, KOTA SURABAYA, JAWA TIMUR", style: TextStyle(color: Colors.grey, fontSize: 11),),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Waktu: Selesai: 18, Aug 2011 23.38", style: TextStyle(color: Colors.grey, fontSize: 11),),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 0.3, color: Colors.grey)
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const[
                        Text("Taki id - Benowo", style: TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500),),
                        Icon(Icons.arrow_forward_ios_outlined, size: 15, color: Colors.grey,)
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const BuildItemBuyed(),
                    const SizedBox(
                      height: 15,
                    ),
                    const BuildItemBuyed(),
                    const SizedBox(
                      height: 15,
                    ),
                    const BuildItemBuyed(),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(width: 0.3, color: Colors.grey)
                                )
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                         Row(
                           children: const[
                              Text("Lihat Lebih Banyak ", style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),),
                              Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 15,),
                           ],
                         ),
                         const SizedBox(
                            width: 10,
                          ),
                         Expanded(
                           child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(width: 0.3, color: Colors.grey)
                                )
                              ),
                            ),
                         ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const[
                        Text("Sub Total (10 Menu)", style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500),),
                        Text("Rp. 675.000", style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500),),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 0.3, color: Colors.grey)
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text("Biaya Pengiriman ", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                            Icon(Icons.info_outline, color: Colors.grey, size: 15,),
                          ],
                        ),
                        Row(
                          children: const[
                            Text("Rp. 725.000", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300, decoration: TextDecoration.lineThrough),),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Rp. 675.000", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                         Row(
                           children: const [
                             Text("Biaya Layanan ", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                             Icon(Icons.info_outline, color: Colors.grey, size: 15,),
                           ],
                         ),
                         const Text("Rp. 15.000", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                         Row(
                           children: const [
                             Text("Subtotal Diskon Makanan ", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                             Icon(Icons.info_outline, color: Colors.grey, size: 15,),
                           ],
                         ),
                         const Text("-Rp. 25.000", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  const[
                          Text("Rp. 665.000", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                      ],
                    ),
                     const SizedBox(
                      height: 10,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  const[
                          Text("Sudah termasuk pajak", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 0.3, color: Colors.grey)
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  const[
                         Text("Rincian Makanan ", style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500),),
                        ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  const [
                         Text("Catatan", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                         Text("Tidak ada", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  const [
                         Text("Nomer Pemesanan", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                         Text("84847474584847477", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  const [
                         Text("Waktu Pemesanan", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                         Text("14 Aug 2022 23.58", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  const [
                         Text("Pembayaran", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
                         Text("CakePay", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),),
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
                          padding: const EdgeInsets.symmetric(horizontal: 16.00, vertical: 5),
                          decoration: BoxDecoration(color: Colors.white, 
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: secondaryColor)),
                          child: Center(child: Text("Beri Penilaian",
                            style: TextStyle(color: secondaryColor, fontSize: 15, fontWeight: FontWeight.w500),)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          // width: 100,
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 16.00, vertical: 5),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: secondaryColor,)),
                          child: const Center(child: Text("Pesan lagi",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),)),
                        ),
                      ),
                    ],
                  ),
                  ],
                ),
              ),
              
            ],
          )
        )
    );
  }
}

class BuildItemBuyed extends StatelessWidget {
  const BuildItemBuyed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
          // borderRadius: BorderRadius.circular(100),
              child: Image.asset("assets/images/morefood3.jpg", width: 50, height: 50, fit: BoxFit.cover,),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Row(
                  children: const[
                  Text("1 x", style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500),),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Vanilla Cake ", style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500),),
                  ],
                ),
                
              ],
            ),
          ],
        ),
        const Text("Rp.225.000", style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500),),
      ],
    );
  }
}
