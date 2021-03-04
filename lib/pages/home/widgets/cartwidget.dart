import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterprovider_deepdive/models/cart.dart';
import 'file:///C:/Users/moppenheimer/repo/android/flutterprovider_deepdive/lib/pages/styles.dart';

class CartWidget extends StatelessWidget {

  final Cart cart;
  CartWidget({@required this.cart, Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          width: 24.0,
          height: 24.0,
          child: SvgPicture.asset('assets/images/icons/cart.svg'),
        ),
        if(cart.cartCount() > 0)
          Positioned(
            top: -4.0,
            right: -4.0,
            child: Container(
              width: 12.0,
              height: 12.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColour,
                shape: BoxShape.circle,
                border: Border.all(color:Colors.white, width: 1.0),
              ),
              child: Text(
                '$cart.cartCount()',
                  style: TextStyle(
                    fontSize: 8.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
              ),
            ),
          ),
      ],
    );
  }
}

