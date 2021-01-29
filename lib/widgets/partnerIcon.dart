import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:flutter/material.dart';

class PartnerApp extends StatelessWidget {
  final AppConfig appConfig;
  final String imageAssetPath;
  final Color backgroundColor;
  final double imageSize;

  PartnerApp(
      {this.appConfig,
      this.imageAssetPath,
      this.backgroundColor,
      this.imageSize});

  @override
  Widget build(BuildContext context) {
    final double imgSize = appConfig.responsive.height(50);
    return Container(
      height: imgSize,
      width: imgSize,
      decoration: BoxDecoration(
          color: this.backgroundColor ?? appConfig.appColors.black,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Image.asset(
          this.imageAssetPath,
          fit: BoxFit.contain,
          width: this.imageSize ?? imgSize - 1.4,
        ),
      ),
    );
  }
}
