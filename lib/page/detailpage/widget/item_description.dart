import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:resto_mobile/utils/color.dart';

class BuildItemDescription extends StatelessWidget {
  const BuildItemDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          SizedBox(
            width: Get.width,
            // height: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text("Description", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
                const SizedBox(
                  height: 5,
                ),
                ReadMoreText(
                  'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.',
                  trimLines: 4,
                  colorClickableText: OprimaryColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Show more',
                  // preDataTextStyle: TextStyle(fontWeight: FontWeight.w500),
                  trimExpandedText: '...Show less',
                  style: const TextStyle(height: 1.5),
                  moreStyle: TextStyle(fontSize: 14, color: OprimaryColor),
                  textAlign: TextAlign.justify,
                  
                // ),
                ),
                // Text(
                //   "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.",
                //   style: TextStyle(fontSize: 12, color: Color.fromARGB(221, 15, 15, 15),  height: 1.5),
                //   textAlign: TextAlign.justify,
                // ),
              ],
            ),
          ),
        ]
      );
  }
}