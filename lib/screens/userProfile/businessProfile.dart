import 'package:common_infra_ads/dataModels/business.dart';
import 'package:flutter/material.dart';

class BusinessProfile extends StatefulWidget {
  final Business businessProfile;

  BusinessProfile({this.businessProfile});

  @override
  _BusinessProfileState createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.businessProfile.businessName),
        centerTitle: true,
      ),
    );
  }
}
