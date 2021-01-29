import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final AppConfig appConfig;
  final String title;
  final Function onTap;

  ProfileOption({this.appConfig, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '$title',
          style: TextStyle(
              color: appConfig.appColors.quoraRed,
              fontSize: appConfig.responsive.height(18),
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat'),
        ),
        GestureDetector(
          onTap: this.onTap ?? () {},
          child: Icon(Icons.arrow_forward_ios,
              color: appConfig.appColors.quoraRed,
              size: appConfig.responsive.height(20)),
        ),
      ],
    );
  }
}
