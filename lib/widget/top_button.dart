import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget BuildTopButton(BuildContext context, Color color, String image) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Image.asset(
          image,
          width: 11,
          height: 11,
        ),
      ),
    );
  }