import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  double width(double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }

  double height(double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }

  EdgeInsets padding(double top, double bottom, double left, double right) {
    return EdgeInsets.only(
      top: height(top),
      bottom: height(bottom),
      left: width(left),
      right: width(right),
    );
  }EdgeInsets paddingOnlyRight(double right) {
    return EdgeInsets.only(
      right: right,
    );
  }
  EdgeInsets paddingAll(double a) {
    return EdgeInsets.all(a);
  }
}
