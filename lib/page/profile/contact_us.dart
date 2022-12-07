import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/utils/color.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact Us"),
          centerTitle: true,
          backgroundColor: OprimaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 20,
              ),
              MemberItem(
                name: "Yowanda Frisky A - CEO",
                phone: "082231532679",
                image: "assets/images/yowanda.jpg",
              ),
              MemberItem(
                name: "Hafizh Dharmawan - COO",
                phone: "085155316774",
                image: "assets/images/hafizh.jpg",
              ),
              MemberItem(
                name: "Wardhatul Mufida - CEO",
                phone: "085816817899",
                image: "assets/images/wardhatul.png",
              ),
              MemberItem(
                name: "Gede Rizky Chandra Saputra - CFO",
                phone: "081999942144",
                image: "assets/images/risky.png",

              ),
              MemberItem(
                name: "Muhammad Faris Rahman - CTO",
                phone: "0895325690949",
                image: "assets/images/faris.png",

              ),
              MemberItem(
                name: "Muhammad Ruchyat Siregar - CMO",
                phone: "085361086319",
                image: "assets/images/ruchyat.png",

              ),
            ],
          ),
        ));
  }
}

class MemberItem extends StatelessWidget {
  const MemberItem({
    Key? key,
    required this.name,
    required this.phone, required this.image,
  }) : super(key: key);
  final String name;
  final String phone;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(200),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    // "Yowanda Frisky A. - CEO",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    phone,
                    // "082231532679",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
