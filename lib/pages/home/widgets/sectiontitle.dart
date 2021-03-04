import 'package:flutter/material.dart';
import 'package:flutterprovider_deepdive/pages/styles.dart';

class SectionTitle extends StatelessWidget {

  final String title;
  final bool hasItems;

  const SectionTitle({this.title, this.hasItems,/* onTap optional */ Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20.0, height: 1),
              ),
              //  has items?
              hasItems == true ? InkWell(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text('View all', style: TextStyle(fontSize: 18.0, height: 1, color: primaryColour),),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.arrow_forward, color: primaryColour,),
                    )
                  ],
                ),
                onTap: () {},
              )
              //  no item, empty text
                  : Text('')
            ],
          ),
        )
      ],
    );
  }
}
