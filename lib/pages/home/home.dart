import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutterprovider_deepdive/models/Initdatamodel.dart';
import 'package:flutterprovider_deepdive/models/category.dart';
import 'package:flutterprovider_deepdive/models/editorpick.dart';
import 'package:flutterprovider_deepdive/models/editorspick_card.dart';
import 'package:flutterprovider_deepdive/models/trending.dart';
import 'file:///C:/Users/moppenheimer/repo/android/flutterprovider_deepdive/lib/pages/home/widgets/category_card.dart';
import 'file:///C:/Users/moppenheimer/repo/android/flutterprovider_deepdive/lib/pages/home/widgets/header.dart';
import 'file:///C:/Users/moppenheimer/repo/android/flutterprovider_deepdive/lib/pages/home/widgets/productcard.dart';
import 'file:///C:/Users/moppenheimer/repo/android/flutterprovider_deepdive/lib/pages/home/widgets/sectiontitle.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //var _categories = _getCategories();
  
  @override
  Widget build(BuildContext context) {

    //  Note the use of Conditional property access:
    //  To guard access to a property or method
    //  of an object that might be null, put a
    //  question mark (?) before the dot (.):
    var categories = Provider.of<InitDataModel>(context)?.categories;
    var editorsPick = Provider.of<InitDataModel>(context)?.editorsPick;
    var trending = Provider.of<InitDataModel>(context)?.trending;
    
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(headerTitle: 'Wheelchair Shop', fontSize: 28.0, height: 1),

                //  CATEGRORIES
                SectionTitle(title: 'Categories', hasItems: true,),
                categories != null ?
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Wrap(
                      spacing: 28.0,
                      children: _buildCategories(categories),
                    ),
                  ),
                )
                :
                Center(child: CircularProgressIndicator()),

                //  Editors Pick
                SectionTitle(title: 'Our Pick', hasItems: false,),
                editorsPick != null ?
                EditorsPickCard(
                  title: editorsPick.title,
                  subtitle: editorsPick.subtitle,
                  imagePath: editorsPick.imagePath,
                ) :
                Center(child: CircularProgressIndicator()),

                    //  Trending
                SectionTitle(title: 'Trending', hasItems: true,),
                    trending != null ?
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Wrap(
                          spacing: 20.0,
                          children: _buildProductCards(trending),
                        ),
                        ):
                Center(child: CircularProgressIndicator()),


                    //_buildEditorsPickCard(_initDataModel.editorsPick)
              ],
            ),
          ),
        ),
    );
  }

  static CategoryCard _addCategoryCard(Category category){
    CategoryCard _categoryCard = CategoryCard(
        categoryBackgroudImageUrl: category.backgroundImagePath,
        title: category.title,
        onTap: (){});
    return _categoryCard;
  }

  List<CategoryCard> _buildCategories(List<Category> categories)
  {
    List<CategoryCard> _cards = [];
    categories.forEach((c) {
      _cards.add(_addCategoryCard(c));
    });

    return _cards;
  }

  List<ProductCard> _buildProductCards(List<Trending> trendingItems){
    List<ProductCard> _productCards = [];
    var someCard = ProductCard();

    trendingItems.forEach((element) {

      _productCards.add(ProductCard(
        product:  element.product,
        onTap: (){},
      ));
    });
    return _productCards;
  }


  /*static List<CategoryCard>_getCategories()
  {
    List<CategoryCard> _cards = [];

    List<Category> _fakeCategories = [
      Category(backgroundImagePath: 'assets/images/categories/wheelchair-category-bg.jpg', title: 'Wheelchairs', description: '', code: 'wheelchair'),
      Category(backgroundImagePath: 'assets/images/categories/wheelchair-category-bg.jpg', title: "Power add-on\'s", description: '', code: 'parts'),
      Category(backgroundImagePath: 'assets/images/categories/wheelchair-category-bg.jpg', title: 'Spare parts', description: '', code: 'poweraddon'),
    ];

    _fakeCategories.forEach((c) => {
      _cards.add(_addCategoryCard(c))
    });

    return _cards;
  }

  static CategoryCard _addCategoryCard(Category category){
    CategoryCard _categoryCard = CategoryCard(categoryBackgroudImageUrl: category.backgroundImagePath ,title: category.title, onTap: (){});
    return _categoryCard;
  }*/

}
