import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:flutter/material.dart';

class CustomTextField1 extends StatelessWidget {
  final TextEditingController textEditingController;
  final AppConfig appConfig;
  final String title;
  final String hintText;
  final Function validator;
  final TextInputType textInputType;
  final bool isDense;
  final bool enabled;
  final Color textColor;
  final int maxLines;

  CustomTextField1(
      {@required this.textEditingController,
      @required this.appConfig,
      @required this.textInputType,
      @required this.title,
      this.maxLines,
      this.enabled,
      this.textColor,
      this.isDense,
      this.hintText,
      this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: appConfig.appTextTheme.textStyle7,
          ),
          TextFormField(
            controller: this.textEditingController,
            keyboardType: this.textInputType,
            cursorColor: appConfig.appColors.blue,
            maxLines: this.maxLines ?? 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: this.validator ??
                (value) {
                  return null;
                },
            enabled: this.enabled ?? true,
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: appConfig.responsive.height(15),
                color: textColor ?? Colors.black),
            decoration: InputDecoration(
                hintText: this.hintText ?? "",
                hintStyle: appConfig.appTextTheme.textStyle8,
                isDense: this.isDense ?? false),
          )
        ],
      ),
    );
  }
}
