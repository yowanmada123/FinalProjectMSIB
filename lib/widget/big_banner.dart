import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: non_constant_identifier_names
Widget BuildBigBanner(BuildContext context) {
    return Container(
      height: 154,
      width: 313,
      decoration: const BoxDecoration(
        color: Color(0xffF0F0F0),
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: 
      SvgPicture.asset(
        'assets/images/cake_slice.svg',
        matchTextDirection: true,
        height: 50,
        width:50,
      ),
      // Image.asset(
      //   'assets/images/aqua.png',
      //   height: 15,
      //   width: 15,
      // ),
    );
  }