import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/data_image.dart';
import 'package:resto_mobile/data/data_product.dart';
import 'package:resto_mobile/page/detailpage/widget/item_description.dart';
import 'package:resto_mobile/page/detailpage/widget/item_review.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/build_bottom_buy.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:readmore/readmore.dart';

  class DetailProductPage extends StatefulWidget {
    const DetailProductPage({Key? key, required this.product}) : super(key: key);
    final FavoriteProduct product;
    @override
    State<DetailProductPage> createState() => _DetailProductPageState();
  }

  class _DetailProductPageState extends State<DetailProductPage> {
    int activeIndex = 0;
    final controller = CarouselController();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    bottom: PreferredSize(
                      child: Container(),
                      preferredSize: Size(0, 20),
                    ),
                    pinned: false,
                    expandedHeight: Get.height * 0.4,
                    flexibleSpace: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              // padding: const EdgeInsets.only(left: 16),
                              // height: 200,
                              color: Colors.white,
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CarouselSlider.builder(
                                  carouselController: controller,
                                  options: CarouselOptions(initialPage: 0, viewportFraction: 1, height: 305, autoPlay: false, autoPlayAnimationDuration: const Duration(seconds: 1), reverse: false, enableInfiniteScroll: false, onPageChanged: (index, reason) => setState(() => activeIndex = index)),
                                  itemCount: allImage.length,
                                  itemBuilder: (context, index, realIndex) {
                                    return ImageProduct(
                                      product: allImage[index],
                                    );
                                  },
                                ),
                              ),
                            ),
                        ),
                        Positioned(top: 200, left: 150, right: 0, bottom: 0, child: buildIndicator()),
                        const Positioned(top: -220, left: 0, right: 0, bottom: 0, child: BuildTopBar()),
                        Positioned(
                          bottom: -2,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.2), //(x,y)
                                  blurRadius: 1,
                                ),
                              ],
                              color: Colors.white,
                              // Colors.lightBlue[100],
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 1500,
                    // Get.height,
                    delegate: SliverChildListDelegate(
                      [
                        BuildDescription(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: BuildBottomBuy(),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       // Add your onPressed code here!
      //     },
      //     backgroundColor: Colors.green,
      //     child: const Icon(Icons.navigation),
          
      //   ),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.endDocked
      );
    }

    Widget buildIndicator() => AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: allImage.length,
          effect: JumpingDotEffect(
            activeDotColor: secondaryColor,
            dotWidth: 10,
            dotHeight: 10,
          ),
        );

    // ignore: non_constant_identifier_names
    Widget BuildDescription(BuildContext context) {
      return Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: Column(
              children: [
                Container(
                  // height: Get.height,
                  width: Get.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.15, right: 24.28),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.product.name,
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black87),
                                ),
                                Text(
                                  "\$${widget.product.finalprice}",
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: primaryColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const BuildDetailDescription(
                              detail: '78 Street. 88 W 21th. St.NY',
                              icon: IconData(0xf193, fontFamily: 'MaterialIcons')
                            ),
                            const BuildDetailDescription(
                              detail: 'Open 7.00 - 21.00',
                              icon: IconData(0xed56, fontFamily: 'MaterialIcons')
                            ),
                            const BuildDetailDescription(
                              detail: '+(62) 822 3556 9874',
                              icon: IconData(0xe126, fontFamily: 'MaterialIcons')
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: secondaryColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: secondaryColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: secondaryColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: secondaryColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.pink[100],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "(4.8) - 1220 Reviews",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[400],
                                    // decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            BuildCustomDivider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.fastfood_outlined,
                                        color: secondaryColor,
                                        size: 15,
                                      ),
                                      // Image.asset("assets/images/ic_fire.png", width: 15, height: 15),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "598 kkal",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[400],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.more_time_rounded,
                                        color: secondaryColor,
                                        size: 15,
                                      ),
                                      // Image.asset("assets/images/ic_fire.png", width: 15, height: 15),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "20-30 minutes",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[400],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.ramen_dining_outlined,
                                        color: secondaryColor,
                                        size: 15,
                                      ),
                                      // Image.asset("assets/images/ic_fire.png", width: 15, height: 15),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Japanese",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[400],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            BuildCustomDivider(),
                            const BuildItemDescription(),
                            BuildCustomDivider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Review", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const BuildItemReview(
                                name: 'Chabib Saiful Arif',
                                date: 'Yesteday, 09.28',
                                profileImage: 'assets/images/people.png',
                                star: '5.0',
                                review: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.'),
                            BuildCustomDivider(),
                            const BuildItemReview(
                                name: 'Alexander Mada',
                                date: 'Today, 11.25',
                                profileImage: 'assets/images/people1.jpg',
                                star: '4.0',
                                review: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.'),
                            BuildCustomDivider(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Positioned(bottom: 20, left: 16, right: 16, child: BuildBottomBuy(context))
      ]);
    }

    // ignore: non_constant_identifier_names
    Widget BuildCustomDivider() {
      return Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            width: Get.width,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xffEFEFEF)),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );
    }
  }

  class BuildDetailDescription extends StatelessWidget {
    const BuildDetailDescription({Key? key, required this.detail, required this.icon}) : super(key: key);
    final String detail;
    final IconData icon;

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          Row(
            children: [
              // const Icon(IconData(0xf518, fontFamily: 'MaterialIcons')),
              Icon(
                icon,
                size: 15,
                color: Colors.grey[400],
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                detail,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                  // decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );
    }
  }

  class BuildTopBar extends StatelessWidget {
    const BuildTopBar({
      Key? key,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.15, vertical: 20.81),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.back();
                // controller.isHomePage.value = true;
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.2), //(x,y)
                        blurRadius: 1,
                      ),
                    ],
                    color: Colors.white,
                    // shape: BoxShape.circle, color: Color(0xff64A1F4)
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 13,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.2), //(x,y)
                          blurRadius: 1,
                        ),
                      ],
                      color: Colors.white,
                      // shape: BoxShape.circle, color: Color(0xff64A1F4)
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite,
                            size: 20,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }
  }

  class ImageProduct extends StatelessWidget {
    final ProductImage product;
    const ImageProduct({required this.product, Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Stack(children: [
        Container(
          // padding: const EdgeInsets.all(16),
          height: 300,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  // AssetImage("assets/images/morefood1.jpg"),
                  AssetImage(product.image),
              fit: BoxFit.cover,
            ),
            // border: Border.all(color: Colors.black87,),
            // borderRadius: BorderRadius.circular(10),
          ),
        ),
      ]);
    }
  }
