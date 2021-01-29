import 'package:common_infra_ads/dataModels/DTOs/searchResult.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:common_infra_ads/widgets/searchResultWidget.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  AppConfig appConfig;
  List<SearchResultWidget> searchResultWidgets = List();

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _searchBar(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: searchResultWidgets,
        ),
      ),
    );
  }

  Widget _searchBar() {
    void _onPressed() {
      setState(() {
        searchResultWidgets.add(SearchResultWidget(
          appConfig: appConfig,
          searchResult: SearchResult(
              photourl: "",
              firstname: "Akshith",
              lastname: "Chittiveli",
              useremail: "akshithchittiveli@gmail.com",
              isPrivate: true),
        ));
      });
    }

    String searchString = "";
    return Container(
      width: appConfig.responsive.width(330),
      height: appConfig.responsive.height(44),
      decoration: BoxDecoration(
        color: Color(0xFFDFDFDF),
        borderRadius: BorderRadius.all(
          Radius.circular(
            appConfig.responsive.height(10),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: appConfig.responsive.width(234),
            height: appConfig.responsive.height(44),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.only(
                    left: appConfig.responsive.width(16),
                  ),
                  hintText: "Search Profiles ...",
                  hintStyle: TextStyle(fontFamily: "Roboto"),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  searchString = value;
                },
                onSubmitted: (value) {
                  print(searchString);
                },
              ),
            ),
          ),
          SizedBox(width: appConfig.responsive.width(25)),
          GestureDetector(
            onTap: () => _onPressed(

                // Trigger a api call to get the functions

                ),
            child: Container(
              width: appConfig.responsive.width(55),
              height: appConfig.responsive.height(44),
              decoration: BoxDecoration(
                color: appConfig.appColors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    appConfig.responsive.height(10),
                  ),
                ),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: appConfig.responsive.width(22),
              ),
            ),
          )
        ],
      ),
    );
  }
}
