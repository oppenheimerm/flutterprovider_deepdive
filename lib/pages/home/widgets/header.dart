import 'package:flutter/material.dart';
import 'package:flutterprovider_deepdive/models/cart.dart';
import 'package:flutterprovider_deepdive/models/favorite.dart';
import 'package:flutterprovider_deepdive/pages/home/widgets/favoritewidget.dart';
import 'file:///C:/Users/moppenheimer/repo/android/flutterprovider_deepdive/lib/pages/home/widgets/cartwidget.dart';
import 'file:///C:/Users/moppenheimer/repo/android/flutterprovider_deepdive/lib/pages/home/widgets/searchbar.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {

  final String headerTitle;
  final double fontSize;
  final double height;

  const Header({
    @required this.headerTitle,
    @required this.fontSize,
    @required this.height,
    key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    ///  In order to access the 'cartCount' from our [Cart] we must
    //  grab an instance of [Cart] in our widget and access
    //  the ‘count’.
    Cart _cartData = Provider.of<Cart>(context);
    Favorites _favoritesData = Provider.of<Favorites>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                headerTitle,
                style: TextStyle(fontSize: fontSize, height:height),
              ),
              /* get count from cart Cart(),*/
              FavoriteWidget(favorites: _favoritesData),
              CartWidget(cart: _cartData)
            ],
          ),
          Text(
            'Find your next wheelchair and more!',
            style: TextStyle(fontSize: 15.0, height: 2, color: Colors.black38),
          ),
          SearchBar(),
        ],
      ),
    );
  }
}
