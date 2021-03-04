import 'package:flutter/material.dart';
import 'package:flutterprovider_deepdive/models/product.dart';
import 'package:flutterprovider_deepdive/models/vendor.dart';

class FavoriteLineItem{
  final DateTime  addDate;
  final String lineId;
  final Product product;

  const FavoriteLineItem({
    this.product,
    this.addDate,
    this.lineId
  });
}