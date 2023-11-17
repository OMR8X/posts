import 'package:flutter/material.dart';

class SpaceHelper {
  static const double padding = 20.0;
  static const double feedPagePadding = 8.0;

  static double getWidthOfHomePageCenterWidget(BuildContext context) {
    return MediaQuery.of(context).size.width - (3 * padding);
  }

  static double getWidthOfSignCenterWidget(BuildContext context) {
    return MediaQuery.of(context).size.width - (2 * padding);
  }
}
