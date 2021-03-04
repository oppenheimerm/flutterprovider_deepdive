import 'package:flutter/material.dart';
import 'package:flutterprovider_deepdive/Helpers/uihelpers.dart';
import 'package:flutterprovider_deepdive/models/favorite.dart';
import 'package:flutterprovider_deepdive/models/product.dart';
import 'package:flutterprovider_deepdive/pages/styles.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {

  final Product product;
  final Function() onTap;

  const ProductCard({
    Key key,
    this.product,
    this.onTap
  }):super(key: key);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {


  @override
  Widget build(BuildContext context) {

    var favorites = Provider.of<Favorites>(context);
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0, bottom: 28.0),
        child: Container(
          padding: EdgeInsets.only(left: 5.0, right: 18.0),
          height: 350.0,
          //  child here
          child: Container(
            margin: EdgeInsets.only(left: 16.0),
            width: 360.0,
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ActivityScreen(activity: activity)),
                    );*/
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      height: 350.0,
                      width: 350.0,
                      image: AssetImage(UIHelpers.getProductImage(productImage: widget.product.imageUrl)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: -15.0,
                  right: 40.0,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        var isFavorite = favorites.isFavorite(widget.product.id);
                        favorites.addFavorite(widget.product);
                      });
                    },
                    icon: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset.zero,
                              blurRadius: 12.0)
                        ],
                      ),
                      child: Icon(
                        Icons.bookmark,
                        size: 40.0,
                        color: favorites.isFavorite(widget.product.id) ? Colors.red : Colors.grey[850],

                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 140.0,
                    width: 350.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black87.withOpacity(0.7),
                          Colors.black54.withOpacity(0.6),
                          Colors.black38.withOpacity(0.1),
                        ],
                        stops: [0.2, 0.4, 0.6, 0.9],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20.0,
                  right: 20.0,
                  bottom: 20.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        UIHelpers.truncate(value: widget.product.title, maxChars: 50),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: 10.0),
                      /*Row(
                        children: <Widget>[
                          SizedBox(width: 10.0),
                          Text(
                            UIHelpers.truncate(value: widget.product.description, maxChars: 24),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
