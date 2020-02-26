import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie/Provider/Dataclass.dart';
import 'package:foodie/Provider/PlacesProvider.dart';
import 'package:provider/provider.dart';

import 'SearchItem.dart';

const googleApiKey = "AIzaSyDmFsYarIa5yJppIMjJ0zph2e3X8bWI0tA";
const baseUrl = "http://maps.googleapis.com";

class CustomSearch extends SearchDelegate {
  PlacesProvider provider;

  @override
  List<Widget> buildActions(BuildContext context) {
    provider = Provider.of<PlacesProvider>(context);
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }



  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print("Search Pressed");
    return FutureBuilder(
        future: provider.mautoCompleteSearch(query),
        builder: (BuildContext context,
            AsyncSnapshot<List<PredictionResult>> snapshot) {
          if (snapshot.hasData) {
            List<PredictionResult> result = snapshot.data;
            return ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {
                  var item = result[index];
                  return InkWell(
                    onTap: () {
                      try {
                        result.clear();
                        returnDetails(item, result, context).then((value) {
                          result = value;
                          close(context, result);
                        });
                      } catch (e) {
                        print(e);
                        close(context, null);
                      }
                    },
                    child: SearchItem(
                      item: item,
                      iconVisibility: item.iconVisibility,
                    ),
                  );
                });
          } else {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: RefreshProgressIndicator(),
              alignment: Alignment.topCenter,
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  Future<List<PredictionResult>> returnDetails(
      PredictionResult item, var result, BuildContext context) async {
    var decode = await provider.decodeAndSelectPlace(item.id);
    item.latLng = decode;
    result.add(item);
    return result;
  }
}
