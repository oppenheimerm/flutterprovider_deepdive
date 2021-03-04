import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterprovider_deepdive/models/favorite.dart';
import 'package:flutterprovider_deepdive/pages/styles.dart';

class FavoriteWidget extends StatelessWidget {

  final Favorites favorites;
  const FavoriteWidget({@required this.favorites, Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          width: 24.0,
          height: 24.0,
          child: SvgPicture.asset('assets/images/icons/heart_icon.svg'),
        ),
        if(favorites.favoriteCount >0 )
          Positioned(
            top: -4.0,
            right: -4.0,
            child: Container(
            width: 12.0,
            height: 12.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            border: Border.all(color:Colors.white, width: 1.0),
            ),
            )
          )
      ],
    );
  }
}
