import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:flutter/material.dart';

class CustomTextField2 extends StatefulWidget {
  final TextEditingController textEditingController;
  final AppConfig appConfig;
  final String title;
  final String hintText;
  final Function validator;
  final TextInputType textInputType;

  CustomTextField2(
      {@required this.textEditingController,
      @required this.appConfig,
      @required this.textInputType,
      @required this.title,
      this.hintText,
      this.validator});

  @override
  _CustomTextField2State createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: widget.appConfig.appTextTheme.textStyle7,
          ),
          TextFormField(
            controller: this.widget.textEditingController,
            keyboardType: this.widget.textInputType,
            cursorColor: widget.appConfig.appColors.blue,
            obscureText: _isHidden,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textAlignVertical: TextAlignVertical.center,
            validator: this.widget.validator ??
                (value) {
                  return null;
                },
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: widget.appConfig.responsive.height(15),
            ),
            decoration: InputDecoration(
              hintText: this.widget.hintText ?? "",
              hintStyle: widget.appConfig.appTextTheme.textStyle8,
              isDense: true,
              suffixIcon: IconButton(
                onPressed: () => _toggleVisibility(),
                iconSize: widget.appConfig.responsive.height(16),
                color: widget.appConfig.appColors.quoraRed,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              ),
            ),
          )
        ],
      ),
    );
  }
}
