import 'package:flutter/material.dart';
import 'package:flutterprovider_deepdive/Helpers/apptypes.dart';
import 'package:flutterprovider_deepdive/models/vendor.dart';

class Product {
  final int id;
  Vendor vendor;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  final int vendorId;
  String videoUrl;
  final ProductType productType;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.imageUrl,
    this.vendorId,
    this.videoUrl,
    this.productType
  });

  bool hasVideo(Product product) => (videoUrl.isNotEmpty == false) ? true : false;
}