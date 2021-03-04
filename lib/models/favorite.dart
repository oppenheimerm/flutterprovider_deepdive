import 'package:flutter/material.dart';
import 'package:flutterprovider_deepdive/models/favoriteLineItem.dart';
import 'package:flutterprovider_deepdive/models/product.dart';
import 'package:uuid/uuid.dart';

class Favorites with ChangeNotifier{

  List<FavoriteLineItem> _favorites;

  Favorites(){
    _favorites = List<FavoriteLineItem>();
  }

  List<FavoriteLineItem> getFavorites(){
    return _favorites;
  }

  int get favoriteCount {
    return _favorites.length;
  }

  void addFavorite(Product product){
    var item = _favorites?.firstWhere((item) => item.product.id == product.id, orElse: () => FavoriteLineItem());
    if(item.product == null){
      // Create uuid object
      var uuid = Uuid();
      var favorite = FavoriteLineItem(product:  product, addDate:  DateTime.now(), lineId: uuid.v1());
      _favorites.add(favorite);
      notifyListeners();
    }
    else{
      _favorites.remove(item);
      notifyListeners();
    }

  }

  void removeFavorite(int productId){
    //  search List<FavoriteLineItem> favorites
    var item = _favorites.singleWhere((product) => product.product.id == productId, orElse: () => FavoriteLineItem());
    if(item.product != null){
      _favorites.remove(item);
      notifyListeners();
    }else{
      return;
    }
  }

  bool isFavorite(int productId){
    var item = _favorites?.firstWhere((item) => item.product.id == productId, orElse: () => FavoriteLineItem());
    if(item.product == null){
      return false;
    }
    else{
      return true;
    }
  }
}
