import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: non_constant_identifier_names
Widget BuildBigBanner(BuildContext context) {
    return Container(
      height: 130,
      width: 313,
      decoration: const BoxDecoration(
        color: Color(0xffD4F0FE),
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: 
      Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: '15% ',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFFA593), fontSize: 18),
                      children:  <TextSpan>[
                        TextSpan(text: 'for all cake', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38, fontSize: 18)),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  Text("For our reguler customer", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black38, fontSize: 14))
                ],
              ),
            )),
          Expanded(
            flex:2,
            child: SvgPicture.asset(
              'assets/images/cake_slice.svg',
              matchTextDirection: true,
              height: 50,
              width:50,
            ),
          ),
        ],
      ),
      // Image.asset(
      //   'assets/images/aqua.png',
      //   height: 15,
      //   width: 15,
      // ),
    );
  }