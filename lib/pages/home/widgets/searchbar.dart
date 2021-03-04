import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterprovider_deepdive/models/productsearch.dart';
import 'package:flutterprovider_deepdive/models/recentsearch.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.0, bottom: 28.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.075),
              offset: Offset(0.0, 1.0),
              blurRadius: 10.0
          )
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
            icon: SvgPicture.asset('assets/images/icons/search.svg'),
          hintText: 'go on, search us...',
          hintStyle: TextStyle(color: Colors.black26, fontSize: 14.0),
          border: InputBorder.none,
        ),
        onTap: (){
          showSearch(context: context, delegate: ProductSearch());
        },

      ),
    );



  }
}
