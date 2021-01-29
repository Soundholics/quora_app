import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:flutter/material.dart';

class EngagementHolder extends StatelessWidget {
  final AppConfig appConfig;
  final String title;
  final String value;
  final String units;

  EngagementHolder(
      {@required this.appConfig,
      @required this.title,
      @required this.value,
      @required this.units});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title, style: appConfig.appTextTheme.textStyle37),
          SizedBox(height: appConfig.responsive.height(2)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value,
                  style: appConfig.appTextTheme.textStyle38
                      .copyWith(color: appConfig.appColors.quoraRed)),
              SizedBox(width: appConfig.responsive.width(2)),
              Text(units, style: appConfig.appTextTheme.textStyle39),
            ],
          ),
        ],
      ),
    );
  }
}
