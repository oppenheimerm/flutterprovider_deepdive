import 'package:flutter/material.dart';

class RecentSearch with ChangeNotifier{

  List<String> _searchHistory;

  RecentSearch(){
    _searchHistory = List<String>();
  }

  Future<List<String>> getRecentSearches() async {
    return await Future.delayed(Duration(seconds: 1), () {
      return _searchHistory;
    });


  }

  int get searchHistoryCount => _searchHistory.length;

  //  Not good on memory usage.  Need to dispose of old history
  void addSearchHistory(String search){
    var item = _searchHistory?.firstWhere((item) => item == search.toLowerCase(), orElse: () => "");
    if(item.isEmpty){
      _searchHistory.add(search);
      //notifyListeners();
    }
  }

  /* currently not used
  void removeFavorite(int productId){
    //  search List<FavoriteLineItem> favorites
    var item = _favorites.singleWhere((product) => product.product.id == productId, orElse: () => FavoriteLineItem());
    if(item.product != null){
      _favorites.remove(item);
      notifyListeners();
    }else{
      return;
    }
  }*/

  /* Currently not used
  bool isFavorite(int productId){
    var item = _favorites?.firstWhere((item) => item.product.id == productId, orElse: () => FavoriteLineItem());
    if(item.product == null){
      return false;
    }
    else{
      return true;
    }
  }*/
}
