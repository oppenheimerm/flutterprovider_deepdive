import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'file:///C:/Users/moppenheimer/repo/android/flutterprovider_deepdive/lib/pages/styles.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String categoryBackgroudImageUrl;
  final Function() onTap;

  const CategoryCard({
    Key key,
    @required this.title,
    @required this.categoryBackgroudImageUrl,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset.zero,
                blurRadius: 15.0)
          ],
        ),
        margin: EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
                child: Image(
                    image: AssetImage(categoryBackgroudImageUrl),
                  height: 220.0,
                  width: 150.0,
                  fit: BoxFit.cover
                )
            ),
            Container(
              height: 200,
              width: 150,
              child: Column(
                children: [
                  /*Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 8, top: 8),
                          padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white38),
                          child: Text(
                            "New",
                            style: TextStyle(color: Colors.white),
                          )
                      )
                    ],
                  ),*/
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}