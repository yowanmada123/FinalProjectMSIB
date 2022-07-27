import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget BuildLine(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 5,
          decoration: BoxDecoration(
            color: const Color(0xff3C7DD9),
            borderRadius: BorderRadius.circular(35.09),
          ),
        ),
        const SizedBox(width: 4),
        Container(
          width: 17,
          height: 5,
          decoration: BoxDecoration(
            color: const Color(0xff64A1F4),
            borderRadius: BorderRadius.circular(35.09),
          ),
        ),
        const SizedBox(width: 4),
        Container(
          width: 24,
          height: 5,
          decoration: BoxDecoration(
            color: const Color(0xff3C7DD9),
            borderRadius: BorderRadius.circular(35.09),
          ),
        ),
      ],
    );
  }