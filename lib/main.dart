import 'package:flutter/material.dart';
import 'package:flutterprovider_deepdive/models/Initdatamodel.dart';
import 'package:flutterprovider_deepdive/models/cart.dart';
import 'package:flutterprovider_deepdive/models/favorite.dart';
import 'package:flutterprovider_deepdive/models/product.dart';
import 'package:flutterprovider_deepdive/models/recentsearch.dart';
import 'file:///C:/Users/moppenheimer/repo/android/flutterprovider_deepdive/lib/pages/home/home.dart';
import 'package:flutterprovider_deepdive/services/fakeApi.dart';
import 'file:///C:/Users/moppenheimer/repo/android/flutterprovider_deepdive/lib/pages/styles.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() async{
  final user = await FakeApiService().login();
  final initData = await FakeApiService().getInitData();
  //  Categories will rarely change so

  runApp(
    //  MultiProvider let's you pass in a list of providers without
    //  nesting anything.
    MultiProvider(
      providers: [
        // The user provider uses a value constructor because the value
        // already exists, and we want to make sure we're using the same user
        Provider<User>.value(value: user),

        FutureProvider<InitDataModel>(create: (_) => FakeApiService().getInitData() ),
        ChangeNotifierProvider<Cart>(create: (_) => Cart()),
        ChangeNotifierProvider<Favorites>(create: (_) => Favorites()),
        ChangeNotifierProvider<RecentSearch>(create: (_) => RecentSearch()),
        //StreamProvider<List<Product>>(create: (_) => FakeApiService().searchProducts(""), initialData: null)
        //FutureProvider<InitDataModel>(create: (context) => FakeApiService().getInitData()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wheelchair Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: primaryColour,
        splashColor: Colors.transparent,

      ),
      home: HomePage(),
    );
  }
}

