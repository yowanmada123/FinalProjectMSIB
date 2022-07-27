import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Row BuildSecondPageLine(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 17.78,
        height: 5.2,
        decoration: BoxDecoration(
          color: const Color(0xff64A1F4),
          borderRadius: BorderRadius.circular(35.09),
        ),
      ),
      const SizedBox(width: 4),
      Container(
        width: 17.78,
        height: 5.2,
        decoration: BoxDecoration(
          color: const Color(0xff3C7DD9),
          borderRadius: BorderRadius.circular(35.09),
        ),
      ),
      const SizedBox(width: 4),
      Container(
        width: 30.47,
        height: 5.2,
        decoration: BoxDecoration(
          color: const Color(0xff3C7DD9),
          borderRadius: BorderRadius.circular(35.09),
        ),
      ),
    ],
  );
}
