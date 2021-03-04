import 'package:flutter/material.dart';

class UIHelpers{
  static String getProductImage({String productImage}){
    return "assets/images/$productImage";
  }

  static String getEditorsPickImage({String productImage}){
    return "assets/images/editorspick/$productImage";
  }

  static String getCategoryImage({String categoryImage}){
    return "assets/images/categories/$categoryImage";
  }

  static String getAssetImage({String image}){
    return "assets/images/ui/$image";
  }

  static String truncate({String value, int maxChars}){
    return value.length <= maxChars ? value : value.substring(0, maxChars) + "...";
  }
}