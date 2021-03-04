import 'package:flutter/material.dart';
import 'package:flutterprovider_deepdive/Helpers/uihelpers.dart';
import 'package:flutterprovider_deepdive/pages/styles.dart';

class EditorsPickCard extends StatelessWidget {
  static final List<Color> bgColors = [
    primaryPromoColour,
    secondaryPromoColour
  ];
  final String title;
  final String subtitle;
  final String imagePath;

  const EditorsPickCard({
    Key key,
    this.title,
    this.subtitle,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Wrap(
              spacing: 28.0,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  width: 350,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset.zero,
                        blurRadius: 15.0,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: bgColors.reversed.toList(),
                    ),
                    image: DecorationImage(
                      image: AssetImage(UIHelpers.getAssetImage(image:"splash1.png")),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      if(this.imagePath != null)
                        Positioned(
                          bottom: 5.0,
                          right: 5.0,
                          height: 130.0,
                          width: 130.0,
                          child: Image.asset(
                            UIHelpers.getEditorsPickImage(
                              productImage: this.imagePath,
                            ),
                            /*fit: BoxFit.contain,*/
                          ),
                        ),
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            UIHelpers.truncate(value: this.title, maxChars: 23),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                height: 1.5
                            ),
                          ),
                          Text(
                            UIHelpers.truncate(value: this.subtitle, maxChars: 23),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                height: 1.5
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: (){},
    );

  }
}
