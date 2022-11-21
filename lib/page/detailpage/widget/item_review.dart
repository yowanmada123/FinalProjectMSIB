import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:resto_mobile/utils/color.dart';

class BuildItemReview extends StatelessWidget {
  const BuildItemReview({Key? key, required this.profileImage, required this.date, required this.review, required this.star, required this.name}) : super(key: key);
  final String profileImage;
  final String date;
  final String review;
  final String star;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    profileImage,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(color: Colors.black87, fontSize: 11, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: OsecondaryColor,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: OsecondaryColor,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: OsecondaryColor,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: OsecondaryColor,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: OsecondaryColor,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          star,
                          style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(
              date,
              style: TextStyle(color: Colors.grey[400], fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        ReadMoreText(
          review,
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
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/morefood3.jpg",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/morefood2.jpg",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/morefood1.jpg",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
