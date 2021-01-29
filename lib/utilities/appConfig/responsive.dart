import 'package:flutter/material.dart';

class Responsive {
  // This class is responsible for the app being responsive
  // Changing constants in this class will effect the layout of the app
  // Class is configured according to the UI design based on Iphone 11 (375 X 812)

  final BuildContext context;
  final double baseHeight = 812;
  final double baseWidth = 375;
  Size screenSize;

  Responsive(this.context) {
    this.screenSize = MediaQuery.of(this.context).size;
  }

  // The following two functions would return height and width based on the baseHeight and baseWidth Provided
  // * For example:
  // * height(5) indicates that for given baseHeight the actual height is 5
  // * the function would consider the target devices height and return the equivalent height
  // * Thus, allows the app to be responsive to any screenSize [height >> width]

  double height(double height) {
    double ratio = baseHeight / height;
    return screenSize.height / ratio;
  }

  double width(double width) {
    double ratio = baseWidth / width;
    return screenSize.width / ratio;
  }

  // The following two functions would return height and width as a percentage of overall screen size
  // * For example:
  // * heightBasedOnPercentage(10) will return 10% of screen Height
  // * widthBasedOnPercentage(5) will return 5% of screen Width

  double heightBasedOnPercentage(double percentage) {
    double height = screenSize.height * (percentage / 100);
    return height;
  }

  double widthBasedOnPercentage(double percentage) {
    double width = screenSize.width * (percentage / 100);
    return width;
  }
}
