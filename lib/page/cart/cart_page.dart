import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/widget/base/form_scaffold.dart';
import 'package:resto_mobile/widget/build_bottom_buy.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
    // required this.image,
    // required this.name,
    // required this.firstprice,
    // required this.finalprice,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // final String image;
  @override
  Widget build(BuildContext context) {
    return OScaffold(
       title: "Beranda",
      backgroundColor: Colors.white,
        body: SafeArea(
        child: 
        SingleChildScrollView(
          child: Column(
              children:[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                  children: [
                    const SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 0.5)    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                          Icon(Icons.map_sharp, color: Colors.green[700],),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Alamat Bakery", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),),
                              SizedBox(height: 5,),
                              Text("Keputih Sari No. 57 Surabaya", style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w700),),
                            ],
                          )
                        ],),
                        const Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Opacity(
                  opacity: 0.4,
                  child: Divider(
                    color: Colors.grey,
                    height: 0.1,
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const CircleAvatar(
                      backgroundColor: Color(0xffC5F0EF),
                      child: Icon(Icons.home_work, color: Color(0xffDD1138),),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Ambil dirumah", style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w700),),
                        SizedBox(height: 5,),
                        Text("Ambil dalam 10 menit", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),),
                      ],
                    ),
                    ],),
                    Container(
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green, width: 0.5)    
                      ),
                      child: Center(child: Text("Ganti", style: TextStyle(color: Colors.green[700], fontSize: 10, fontWeight: FontWeight.w500),))),
                  ],
                ),
                ],
                ),
                ),
                const SizedBox(height: 20,),
                // const SizedBox(height: 10,),
                const Divider(
                  color: Colors.grey,
                  height: 0.1,
                ),
                const SizedBox(height: 5,),
                BuildItem(),
                BuildItem(),
                BuildItem(),
                const SizedBox(height: 5,),
                const Divider(
                  color: Colors.grey,
                  height: 0.1,
                ),
                const SizedBox(height: 10,),
                BuildTambahPesanan(),
                const SizedBox(height: 20,),
                const Divider(
                  color: Colors.grey,
                  height: 0.1,
                ),
                const SizedBox(height: 20,),
                BuildDiskon(),
                const SizedBox(height: 20,),
                const Divider(
                  color: Colors.grey,
                  height: 0.1,
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 0.5)    
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Total Pembayaran", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700),),
                                  SizedBox(height: 10,),
                                  Text("35.000", style: TextStyle(color: Colors.black87, fontSize: 14),),
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/images/cake_rainbow.jpg", 
                                width: 80,
                                height: 80,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal:5, vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.grey, width: 1)    
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.note_alt_outlined, size: 15, color: Colors.black87),
                                        SizedBox(width: 5,),
                                        Text("Catatan", style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w700),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal:5, vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.green, width: 1)    
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.add, size: 15, color: Colors.green),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  const Text("1", style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w700),),
                                  const SizedBox(width: 15,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal:5, vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.green, width: 1)    
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.remove, size: 15, color: Colors.green),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              
          ),
          ),
        )
      // Stack(children: [
      //   BuildItemDescription(context),
      //   BuildItemImage(context),
      //   BuildTopBar(context),
      //   BuildBottomBuy(context),
      // ]),
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
            Text("Ada Pesanan Lain ?", style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w700),),
            SizedBox(height: 5,),
            Text("Kamu masih bisa tambah kue lain loh.", style: TextStyle(color: Colors.grey, fontSize: 12),),
          ],
          ),
          Container(
            height: 30,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green, width: 0.5)    
            ),
            child: Center(child: Text("Tambah", style: TextStyle(color: Colors.green[700], fontSize: 14, fontWeight: FontWeight.w500),))),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildItemDescription(BuildContext context) {
    return Positioned(
      top: 320,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                color: Color(0xffFF485A)),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 13),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(60)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.15, right: 24.28, top: 24.55),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  // name,
                                  "haha",
                                  style: TextStyle(
                                      fontSize: 13.87,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff47623F)),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 78.04,
                                      height: 20.81,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.14),
                                          color: const Color(0xffDFAE1D)),
                                      child: const Center(
                                        child: Text(
                                          "Barang Bekas",
                                          style: TextStyle(
                                              fontSize: 8.67,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8.67,
                                    ),
                                    Container(
                                      width: 52.9,
                                      height: 20.81,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.14),
                                          color: const Color(0xff64A1F4)),
                                      child: const Center(
                                          child: Text(
                                        "Stok 100",
                                        style: TextStyle(
                                            fontSize: 8.67,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      )),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 4.34,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                     Text(
                                      "Rp. 20000",
                                      // "Rp. " + firstprice,
                                      style:  TextStyle(
                                        fontSize: 15.61,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff64A1F4),
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                     Text(
                                      "Rp. 20000",
                                      // "Rp. " + finalprice,
                                      style:  TextStyle(
                                          fontSize: 13.01,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff3C7DD9)),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 70.24,
                                  height: 16.48,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(18.21),
                                      color: const Color(0xff3C7DD9)),
                                  child: const Center(
                                      child: Text(
                                    "Diskon 10%",
                                    style: TextStyle(
                                        fontSize: 8.67,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  )),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.14),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Color(0xffEFEFEF)),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "vendor",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff47623F)),
                                    ),
                                    const SizedBox(
                                      height: 8.67,
                                    ),
                                    Row(
                                      children: const [
                                        CircleAvatar(
                                          child: Icon(Icons.person),
                                          // backgroundImage: 
                                          // Icon(Icons.person)
                                          // AssetImage(
                                          //     'assets/images/profile.png'),
                                          radius: 17.5,
                                        ),
                                        SizedBox(
                                          width: 15.07,
                                        ),
                                        Text(
                                          "Eiger Store",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xff000000)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Icon(Icons.star,size: 32.95),
                                    // Image.asset(
                                    //   "assets/images/Star1.png",
                                    //   width: 32.95,
                                    //   height: 32.95,
                                    // ),
                                    Text(
                                      "5.0 | 200 Terjual",
                                      style: TextStyle(
                                          fontSize: 11.27,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff3C7DD9)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12.14,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 110,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Deskripsi",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff47623F))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff47623F)),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Ulasan dan Penilaian",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff47623F))),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15.61,
                            ),
                            // BuildCustomerReview(
                            //     context,
                            //     "assets/images/Ellipse1.png",
                            //     "Maude Hall",
                            //     "14 min",
                            //     "5.0",
                            //     "That's a fantastic new app feature. You and your team did an excellent job of incorporating user testing feedback."),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // BuildCustomerReview(
                            //     context,
                            //     "assets/images/Ellipse2.png",
                            //     "Ester Howard",
                            //     "14 min",
                            //     "5.0",
                            //     "That's a fantastic new app feature. You and your team did an excellent job of incorporating user testing feedback."),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15.07,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(60)),
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container BuildCustomerReview(BuildContext context, String image, String name,
      String time, String star, String comment) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.14),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.1), //(x,y)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 12.42, right: 12.42, top: 13.87, bottom: 17.34),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: Color(0xff7c94b6),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(320, 220)),
                      ),
                      child: Image.asset(image),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff000000))),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(time,
                            style: const TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffB4BBC6))),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/OrangeStar.png",
                      width: 11.27,
                      height: 11.27,
                    ),
                    Text(
                      star,
                      style: const TextStyle(
                          fontSize: 10.41,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000)),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 29,
              child: Text(
                comment,
                style:
                    const TextStyle(fontSize: 8.67, color: Color(0xff272727)),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildTopBar(BuildContext context) {
    // var controller = Get.put(MainController());
    return Positioned(
      top: 0,
      child: Container(
        height: 66,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 25.15, vertical: 20.81),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                      // controller.isHomePage.value = true;
                    },
                    child: Container(
                      height: 19.08,
                      width: 19.08,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff64A1F4)),
                      child: const FittedBox(
                          fit: BoxFit.cover,
                          child: Icon(
                            Icons.arrow_back,
                            size: 2,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  const Text(
                    "PRODUK DETAIL",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff64A1F4)),
                  )
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.to(const CartPage());
                    },
                    child: 
                    SvgPicture.asset(
                    'assets/images/cake_slice.svg',
                    matchTextDirection: true,
                    height: 20.81,
                    width: 20.81,
                  ),
                    // Image.asset(
                    //   "assets/images/blue_bag.png",
                    //   width: 20.81,
                    //   height: 20.81,
                    // ),
                  ),
                  const SizedBox(
                    width: 8.67,
                  ),
                  SvgPicture.asset(
                    'assets/images/cake_slice.svg',
                    matchTextDirection: true,
                    height: 20.81,
                    width: 20.81,
                  ),
                  // Image.asset(
                  //   "assets/images/red_bell.png",
                  //   width: 20.81,
                  //   height: 20.81,
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildItemImage(BuildContext context) {
    return Positioned(
        top: 80,
        left: 68.5,
        child: SizedBox(
            height: 194.67,
            width: 222,
            child: Column(
              children: [
                FittedBox(
                    fit: BoxFit.contain,
                    child: 
                    SvgPicture.asset(
                      // image,
                    'assets/images/cake_slice.svg',
                    matchTextDirection: true,
                    height: 15,
                    width: 15,
                  ),
                    // Image.asset(
                    //   image,
                    //   width: 221.99,
                    //   height: 179.5,
                    // ),
                ),
                const SizedBox(
                  height: 8.67,
                ),
                // BuildSecondPageLine(context)
              ],
            ),),);
  }
}

class BuildDiskon extends StatelessWidget {
  const BuildDiskon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 243, 6),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 0.5)    
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: [
                      Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset("assets/images/coupon.png", 
                        width: 50,
                        height: 50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Diskon hingga 75%", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w700),),
                        Text("diskon terpasang hingga +19.756,00", style: TextStyle(color: Colors.black87, fontSize: 10),),
                      ],
                    ),
                    ],),
                    
                    Container(
                          height: 30,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 231, 4, 0),
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Colors.red, width: 0.5)    
                          ),
                          child: Center(child: Text("Ganti", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),))),
                    
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 0.5)    
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Rainbow Cake", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700),),
                      SizedBox(height: 10,),
                      Text("35.000", style: TextStyle(color: Colors.black87, fontSize: 14),),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset("assets/images/cake_rainbow.jpg", 
                    width: 80,
                    height: 80,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey, width: 1)    
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.note_alt_outlined, size: 15, color: Colors.black87),
                            SizedBox(width: 5,),
                            Text("Catatan", style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w700),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.green, width: 1)    
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.add, size: 15, color: Colors.green),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15,),
                      const Text("1", style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w700),),
                      const SizedBox(width: 15,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.green, width: 1)    
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.remove, size: 15, color: Colors.green),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
