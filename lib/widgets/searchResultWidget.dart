import 'package:common_infra_ads/dataModels/DTOs/searchResult.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:flutter/material.dart';

class SearchResultWidget extends StatelessWidget {
  final AppConfig appConfig;
  final SearchResult searchResult;

  SearchResultWidget({this.appConfig, this.searchResult});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // go to profile page
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: appConfig.responsive.height(5)),
        child: Container(
          decoration:
              BoxDecoration(color: appConfig.appColors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ]),
          padding: EdgeInsets.symmetric(
              vertical: appConfig.responsive.height(15),
              horizontal: appConfig.responsive.width(20)),
          width: appConfig.responsive.widthBasedOnPercentage(97),
          child: ListTile(
            isThreeLine: false,
            // leading: CircleAvatar(
            //   backgroundImage: AssetImage("name"),
            // ),
            title: Text(searchResult.firstname + " " + searchResult.lastname),
            subtitle: Text(searchResult.useremail),
            trailing: searchResult.isPrivate
                ? Icon(
                    Icons.lock,
                    color: appConfig.appColors.quoraRed,
                  )
                : Icon(
                    Icons.lock,
                    color: Colors.transparent,
                  ),
          ),
        ),
      ),
    );
  }
}
