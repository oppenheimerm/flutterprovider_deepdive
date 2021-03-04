import 'package:flutter/material.dart';
import 'package:flutterprovider_deepdive/models/favorite.dart';
import 'package:flutterprovider_deepdive/models/product.dart';
import 'package:flutterprovider_deepdive/models/recentsearch.dart';
import 'package:flutterprovider_deepdive/services/fakeApi.dart';
import 'package:provider/provider.dart';

//  Working with FutureBuilder
//  see: https://flutterigniter.com/build-widget-with-async-method-call/
//  https://medium.com/nonstopio/flutter-future-builder-with-list-view-builder-d7212314e8c9
//  https://medium.com/flutter-community/search-as-you-type-in-flutter-e042168e6517



//  A specialized class for handling searches.  We need to extend [SearchDelegate] and
//  override buildResults(), buildResults() and  buildActions().  Of note here is
// buildResults - as this is dependent on a ]Future] request we needed to add some.
//  special handling.  This widget is used in our searchbar widget.
class ProductSearch extends  SearchDelegate{

  //  provides some visual / feedback queues.  if no search history, use these
  final suggestedSearch = [
    "adjustable",
    "Carbon"
    "Kuschall",
    "lightweight",
    "light-weight",
    "TiLite",
    "Sunrise",
    "Power"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //  What kind of actions we want to preform
    return [
      /* our close button */
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      /* our back arrow */
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    /*if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }*/

    var results = FakeApiService().searchProducts(query);

    //  if results is not equal to null add this query to history
    /*if(results != null){
      Provider.of<RecentSearch>(context).addSearchHistory(query);
    }*/

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //  Build the results based on the stream results
          StreamBuilder(
            stream: results,
            builder: (context, AsyncSnapshot<List<Product>> snapshot){
              if(!snapshot.hasData){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              }else if  (snapshot.data.length == 0){
                return Column(
                  children: <Widget>[
                    Text(
                      "No Results Found.",
                    ),
                  ],
                );
              }else{
                var results = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    var result = results[index];
                    return ListTile(
                      title: Text(
                        result.title
                      ),
                      leading: Icon(Icons.arrow_forward_ios_outlined),
                      onTap: (){
                        query = result.title;
                      },
                    );
                  }
                  );
              }
            },
          ),
        ],
      ),
    );

    /*return StreamBuilder(
      stream: FakeApiService().searchProducts(searchQuery),
    );*/
  }

  //  https://www.youtube.com/watch?v=FPcl1tu0gDs&t=77s&ab_channel=mtechviral

  @override
  Widget buildSuggestions(BuildContext context) {
    var _searchHistory = Provider.of<RecentSearch>(context);

    //  https://www.youtube.com/watch?v=Wm3OiFBZ2xI&t=2447s&ab_channel=GoogleDevelopers
    //  StreamBuilder
    FakeApiService().searchProducts(query);
    return StreamBuilder<List<Product>>(
      stream: FakeApiService().searchProducts(query),
      builder: (context, AsyncSnapshot<List<Product>> snapshot){
        if(!snapshot.hasData){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: CircularProgressIndicator()),
            ],
          );
        }else if  (snapshot.data.length == 0){
          return Column(
            children: <Widget>[
              Text(
                "No Results Found.",
              ),
            ],
          );
        }
        //final suggestionList = snapshot.data.isEmpty ? suggestedSearch : snapshot.data;
        final result = snapshot.data;
        return ListView(
          children: result.map<ListTile>((p) => ListTile(
            title: RichText(
              text: TextSpan(
                text: p.title.toString().substring(0, query.length),
                style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold
                ),
                children: [
                  TextSpan(
                    text: p.title.toString().substring(query.length),
                    style: TextStyle(color: Colors.grey)
                  )
                ]
              ),
            ),
              /*title: Text(
                  p.title,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.blue
                ),
              ),*/
            //leading: Icon(Icons.arrow_forward_ios_outlined),
            onTap: (){
            },
          )).toList(),
        );
      }
    );
  }
  
}

