import 'dart:core';
import 'dart:math';

import 'package:flutterprovider_deepdive/Helpers/apptypes.dart';
import 'package:flutterprovider_deepdive/models/Initdatamodel.dart';
import 'package:flutterprovider_deepdive/models/cart.dart';
import 'package:flutterprovider_deepdive/models/category.dart';
import 'package:flutterprovider_deepdive/models/editorpick.dart';
import 'package:flutterprovider_deepdive/models/favorite.dart';
import 'package:flutterprovider_deepdive/models/product.dart';
import 'package:flutterprovider_deepdive/models/trending.dart';
import 'package:flutterprovider_deepdive/models/user.dart';
import 'package:flutterprovider_deepdive/models/vendor.dart';
import 'file:///C:/Users/moppenheimer/repo/android/flutterprovider_deepdive/lib/pages/home/widgets/category_card.dart';

class FakeApiService{

  Future<List<Product>> intSearchSuggestion() async{

    List<int> _productIds = [2, 3, 5, 6, 8, 9];
    List<Product>_suggestionList;

    return await Future.delayed(Duration(seconds: 1), () {
      List <Product> _products = [];
      _productIds.forEach((element) {
        _suggestionList.add(_getProduct(element));
      });
      return _suggestionList;
    });

  }

  Future<User> login() async {
    return await Future.delayed(Duration(seconds: 1), () {
      return User(firstname: 'Michiel', cart: Cart(), favorites: Favorites());
    });
  }

  Future<InitDataModel>getInitData() async {
    InitDataModel _initDataModel = InitDataModel();

    await getEditorsPick().then((value) => _initDataModel.editorsPick = value);
    await getCategories().then((categories) => _initDataModel.categories = categories);
    await getTrending().then((trend) => _initDataModel.trending = trend);

    return _initDataModel;
  }

  /// Get all vendors. Delayed by 2 seconds to mimick network
  Future<List<Vendor>> getVendors() async{
    List<Vendor> _allVendors = [];
    await Future.delayed(Duration(seconds: 2), () {
      _vendorsInDatabase.forEach((v) => _allVendors.add(v));
    });
    return _allVendors;
  }

  Future<EditorsPick>getEditorsPick() async{
    EditorsPick _editorsPick;
    await Future.delayed(Duration(seconds: 3), () {
      _editorsPick = EditorsPick(
        title: 'J3 Carbon Back',
        subtitle: 'Ultra lightweight and stylish backrest for active users',
        imagePath: 'jay-carbon-back.png'
      );
    });
    return _editorsPick;
  }


  Future<List<Product>> getProducts() async{
    List<Product> _products = [];
    await Future.delayed(Duration(seconds: 2), (){
      _productsInDatabase.forEach((p) => {
        p.vendor = _getVendor(p.vendorId),
        _products.add(p)
      });
    });
  }

  Future<List<Trending>> getTrending() async{
    List<int> _productIds = [1, 3, 7, 9, 13, 16];

    List <Trending> _trendingItems = [];
    _productIds.forEach((element) {
      _trendingItems.add(Trending(product:_getProduct(element), likeCount: _getRandomNumber(109)));
    });
    return _trendingItems;
  }

  //  Generate a random numer
  int _getRandomNumber(int highestNumber){
    var random = Random();
    int _numb;//our number to return

    _numb = random.nextInt(highestNumber);
    if(_numb != 0)
      {
        return _numb;
      }
    else{
      int newNumber = _getRandomNumber(highestNumber);
      return newNumber;
    }
  }

  /* duplicate
  Future<List<Category>> _getCategories() async{
    List<Category> _categories = [];
    await Future.delayed(Duration(seconds: 2), (){
      _fakeCategories.forEach((c) => {
        _categories.add(c)
      });
    });
  }*/

  Vendor _getVendor(int vendorId){
    //  see: https://api.dart.dev/stable/2.10.4/dart-core/Iterable/firstWhere.html
    //  https://codeburst.io/top-10-array-utility-methods-you-should-know-dart-feb2648ee3a2
    return _vendorsInDatabase.firstWhere((element) => element.id == vendorId );
  }

  Product _getProduct(int productId){
    return _productsInDatabase.firstWhere((element) => element.id == productId);
  }

  //  fake data
  List<Vendor> _vendorsInDatabase = [
    Vendor(id: 30, vendorName: 'Motion Composites', vendorUrl: 'https://www.motioncomposites.com/en_intl', vendorCode: 'MTCP'),
    Vendor(id: 31, vendorName: 'Rehateam S.r.l.', vendorUrl: 'https://www.rehateamprogeo.com/index.php/en/', vendorCode: 'RHTM'),
    Vendor(id: 32, vendorName: 'Sunrise Medical', vendorUrl: 'https://www.sunrisemedical.co.uk/', vendorCode: 'SUMD'),
    Vendor(id: 33, vendorName: 'Küschall', vendorUrl: 'https://kuschall.com/uk-en', vendorCode: 'KULL'),
    Vendor(id: 34, vendorName: 'Pandhora', vendorUrl: 'https://www.pandhora.it/en/', vendorCode: 'PDRA'),
    Vendor(id: 35, vendorName: 'Permobil', vendorUrl: 'https://permobilus.com/products/tilite-manual-wheelchairs-smartdrive-power-assist/tilite/', vendorCode: 'PMBL'),
    Vendor(id: 36, vendorName: 'SMOOV', vendorUrl: 'https://smoov.com/gb-en/', vendorCode: 'SMOV'),
    Vendor(id: 37, vendorName: 'Hands On Concepts', vendorUrl: 'https://www.teamhoc.com/', vendorCode: 'THOC'),
    Vendor(id: 38, vendorName: 'UNAcare, Pte. Ltd.', vendorUrl: 'https://unawheel.eu/', vendorCode: 'UCRE')
    /*Vendor(id: 36, vendorName: '', vendorUrl: '', vendorCode: ''),
    Vendor(id: 35, vendorName: '', vendorUrl: '', vendorCode: ''),
    Vendor(id: 36, vendorName: '', vendorUrl: '', vendorCode: ''),*/
  ];

  List<Product> _productsInDatabase = [
    Product(id: 1, vendorId: 30, productType: ProductType.wheelchair, title: 'Motion Composites Apex C Carbon Rigid Wheelchair', price: 3295.0, description: 'The Apex Carbon wheelchair by Motion Composites belongs to a new era of rigid wheelchairs. A balanced blend of technology and design, it is the ultimate in lightness, durability, flexibility and style. A high-end technology and all the advantages of carbon fibre in a modern-looking, fully adjustable chair', imageUrl:'motion-composites-Apex-C.jpg'),
    Product(id: 2, vendorId: 31, productType: ProductType.wheelchair, title: 'Progeo Carbomax Rigid Wheelchair', price: 5660.0, description: 'Stemmed from the research on the use of advanced materials, Carbomax is the extreme synthesis of the current PROGEO studies. Made of a full carbon fibre frame, it adopts the latest technologies in each detail. Design, lightness and rigidness at the highest level, yet keeping ample and simple adjustments.', imageUrl:'progeo-carbomax-rigid.jpg'),
    Product(id: 3, vendorId: 32, productType: ProductType.wheelchair, title: 'Sunrise Medical Quickie Krypton R Rigid Wheelchair', price: 3500.0, description: 'The QUICKIE Krypton R is the lightest, fully adjustable rigid wheelchair. We didn’t compromise. There was only one material we could use to achieve this level of performance – aerospace engineered carbon fibre. The result is a phenomenal rigidity and razor-sharp agility packed into a fully adjustable wheelchair concept.', imageUrl:'quickie-krypton-r-rigid.jpg'),
    Product(id: 4, vendorId: 31, productType: ProductType.wheelchair, title: 'Progeo Joker Rigid Wheelchair', price: 2340.0, description: 'Linear and aggressive, Joker uses innovative technical solutions for full personalization. Patented system for an easy and quick rear height and setting adjustments, removable mudguards as standard.', imageUrl: 'progeo-joker-rigid.jpg'),
    Product(id: 5, vendorId: 32, productType: ProductType.wheelchair, title: 'Sunrise Medical Quickie Helium Pro Rigid Wheelchair', price: 3124.0, description: 'Minimal, ultra-lightweight and completely refreshed, discover the next level of the high-performance wheelchair with the QUICKIE Helium Pro. With a fully-welded frame and fixed welded backrest and axle, the Helium Pro provides the highest rigidity and most efficient driving performance yet for a rigid wheelchair.', imageUrl: 'quickie-helium-pro.jpg'),
    Product(id: 6, vendorId: 32, productType: ProductType.wheelchair, title: 'Sunrise Medical Quickie Helium Rigid', price: 2725.0, description: 'Minimal, ultra-lightweight and completely refreshed, discover the next level of a high-performance wheelchair with the QUICKIE Helium. Using modern Carbotecture® and hydroforming technology to deliver an extremely strong, sturdy and ultra-lightweight wheelchair, the Helium delivers impressive driving characteristics and quick, direct reactions to the most minimal of effort.', imageUrl: 'quickie-helium-rigid.jpg'),
    Product(id: 7, vendorId: 33, productType: ProductType.wheelchair, title: 'Küschall K Series 2.0 Aluminium Wheelchair', price: 1885.0, description: 'Unrivalled quality, rigidity and driving performance ensures your K-Series delivers on strength and performance, allowing you to focus on the important things in your active lifestyle. The K-Series is fully adjustable making this a wheelchair you know will fit to your exact requirements.', imageUrl: 'Küschall-K-Series-2-Aluminium.jpg'),
    Product(id: 8, vendorId: 33, productType: ProductType.wheelchair, title: 'Küschall Champion 2.0 Aluminium Wheelchair', price: 1995.0, description: 'The Kuschall Champion 2.0 is a super lightweight folding chair that can be highly customised to suit the users needs. As well as the basic dimensions of the chair, the Champion offers fine adjustment of the centre of gravity, which in combination with its highly rigid frame makes for effective and efficient propelling.', imageUrl: 'Küschall-Champion-2-Aluminium.jpg'),
    Product(id: 9, vendorId: 34, productType: ProductType.wheelchair, title: 'Pandhora Evo', price: 1795.0, description: 'The Pandhora Evo is an innovative and elegant super-lightweight rigid frame wheelchair with some extremely elegant design features. Most notably the Evos backrest uses a clever switchable hinge that allows the backrest angle to be quickly adjusted through a range of 300 degrees', imageUrl: 'Pandhora-Evo.jpg'),
    Product(id: 10, vendorId: 35, productType: ProductType.wheelchair, title: 'TiLite ZR', price: 2795.0, description: 'The TiLite ZR is a made-to-measure chair featuring a super lightweight mono-tube titanium frame. With a sleek, minimal design and a wide range of customisable options, the ZR provides a very high level of performance and comfort. ', imageUrl: 'TiLite-ZR.jpg'),
    Product(id: 11, vendorId: 35, productType: ProductType.wheelchair,  title: 'TiLite ZRA', price: 2540, description: 'The TiLite ZRA is an adjustable chair featuring a super lightweight mono-tube titanium frame. With a sleek, minimal design and a wide range of customisable options, the ZRA provides a very high level of performance and comfort. Constructed from aerospace-grade titanium, the ZRA absorbs vibration and offers an extremely high strength to weight ratio.', imageUrl: 'TiLite-ZRA.jpg'),
    Product(id: 12, vendorId: 35, productType: ProductType.wheelchair, title: 'TiLite Aero Z', price: 17.95, description: 'The TiLite Aero Z is an adjustable chair featuring a super lightweight mono-tube aluminium frame. With a sleek, minimal design and a wide range of customisable options, the Aero Z provides a very high level of performance and comfort. ', imageUrl: 'TiLite-Aero-Z.jpg'),
    Product(id: 13, vendorId: 36, productType: ProductType.poweraddon, title: 'SMOOV One', price: 4050.0, description: 'The SMOOV One is an electric power assist drive unit for active wheelchairs which significantly increases the drivers day to day mobility Independence.Easy to transport, the SMOOV is light enough for daily use yet robust as a result of high-quality materials and a weight of just 7.2KG.', imageUrl: 'smoov-one.jpg'),
    Product(id: 14, vendorId: 25, productType: ProductType.poweraddon, title: 'Permobil SmartDrive MX2+ Power Assist', price: 4555.25, description: 'The SmartDrive gives you freedom to do more. It moves with you and it’s so lightweight, you don’t even know it’s there. You can spin in place, be in a wheelie, or hop off curbs. It is compatible with your active lifestyle.', imageUrl: 'Permobil-SmartDrive-MX2.jpg'),
    Product(id: 15, vendorId: 37, productType: ProductType.wheelchair, title: 'Rigid Series', price: 1950.0, description: 'A lightweight wheelchair with a clean and simple look', imageUrl: 'thoc-rigid.jpg'),
    Product(id: 16, vendorId: 37, productType: ProductType.wheelchair, title: ' El Toro', price: 2350.0, description: 'A new swing on an old favorite', imageUrl: 'thoc-el-toro.jpg'),
    Product(id: 17, vendorId: 38, productType: ProductType.poweraddon, title: ' UNAwheel Mini', price: 2350.0, description: 'UNAwheel Mini the world’s lightest wheelchair power add-on', imageUrl: 'Unawheel-mini.jpg'),
    /*Product(id: 15, vendorId: 0, productType: ProductType.wheelchair, title: '', price: , description: '', imageUrl: ''),
    Product(id: 16, vendorId: 0, productType: ProductType.wheelchair, title: '', price: , description: '', imageUrl: ''),
    Product(id: 17, vendorId: 0, productType: ProductType.wheelchair, title: '', price: , description: '', imageUrl: ''),
    Product(id: 18, vendorId: 0, productType: ProductType.wheelchair, title: '', price: , description: '', imageUrl: ''),
    Product(id: 19, vendorId: 0, productType: ProductType.wheelchair, title: '', price: , description: '', imageUrl: ''),
    Product(id: 14, vendorId: 0, title: '', price: , description: '', imageUrl: ''),
    Product(id: 15, vendorId: 0, title: '', price: , description: '', imageUrl: ''),
    Product(id: 16, vendorId: 0, title: '', price: , description: '', imageUrl: ''),
    Product(id: 17, vendorId: 0, title: '', price: , description: '', imageUrl: ''),
    Product(id: 18, vendorId: 0, title: '', price: , description: '', imageUrl: ''),
    Product(id: 19, vendorId: 0, title: '', price: , description: '', imageUrl: ''),*/
  ];


  Future<List<Category>>getCategories() async{

    List<Category> _categories = [];

    List<Category> _fakeCategories = [
      Category(backgroundImagePath: 'assets/images/categories/wheelchair-category-bg.jpg', title: 'Wheelchairs', description: '', code: 'wheelchair'),
      Category(backgroundImagePath: 'assets/images/categories/wheelchair-category-bg.jpg', title: "Power add-on\'s", description: '', code: 'parts'),
      Category(backgroundImagePath: 'assets/images/categories/wheelchair-category-bg.jpg', title: 'Spare parts', description: '', code: 'poweraddon'),
    ];

    //  unecessary, but we are just using future here for the dely
    //   and testing FutureProvider.
    await Future.delayed(Duration(seconds: 2), () {
      _fakeCategories.forEach((c) => {
        _categories.add(c)
      });
    });//.whenComplete(() => _cards);*/

    return _categories;
  }

  //  https://medium.com/flutter-community/search-as-you-type-in-flutter-e042168e6517
  Stream<List<Product>> searchProducts(String searchQuery) {
    List<Product> _found = [];
    _productsInDatabase.forEach((product) {
      if(product.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
      product.description.toLowerCase().contains(searchQuery.toLowerCase())){
        _found.add(product);
      }
    });
    return Stream<List<Product>>.value(_found);
  }

  static List<CategoryCard>_getCategories()
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
  }


}


