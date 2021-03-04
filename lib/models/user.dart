import 'package:flutter/material.dart';
import 'package:flutterprovider_deepdive/models/cart.dart';
import 'package:flutterprovider_deepdive/models/favorite.dart';

class User {
  final String firstname;
  final Cart cart;
  final Favorites favorites;

  User({this.firstname, this.cart, this.favorites});
}