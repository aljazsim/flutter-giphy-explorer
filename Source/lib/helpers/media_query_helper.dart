import "dart:math";

import "package:flutter/material.dart";
import "package:giphy_explorer/helpers/media_query_size.dart";

abstract class MediaQueryHelper {
  static const int _breakPointXS = 320;
  static const int _breakPointS = 480;
  static const int _breakPointM = 768;
  static const int _breakPointL = 1024;
  static const int _breakPointXL = 1600;
  static const int _breakPointXXL = 1920;
  static const int _breakPointXXXL = 2560;
  static const int _breakPointWidescreen = 3200;

  static T get<T>(BuildContext context, List<T> options) {
    var size = getSize(context);

    if (size == MediaQuerySize.xs) {
      return options[0];
    } else if (size == MediaQuerySize.s) {
      return options[min(options.length - 1, 1)];
    } else if (size == MediaQuerySize.m) {
      return options[min(options.length - 1, 2)];
    } else if (size == MediaQuerySize.l) {
      return options[min(options.length - 1, 3)];
    } else if (size == MediaQuerySize.xl) {
      return options[min(options.length - 1, 4)];
    } else if (size == MediaQuerySize.xxl) {
      return options[min(options.length - 1, 5)];
    } else if (size == MediaQuerySize.xxxl) {
      return options[min(options.length - 1, 6)];
    } else if (size == MediaQuerySize.widescreen) {
      return options[min(options.length - 1, 7)];
    } else {
      return options[min(options.length - 1, 8)];
    }
  }

  static MediaQuerySize getSize(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    if (width <= _breakPointXS) {
      return MediaQuerySize.xs;
    } else if (width <= _breakPointS) {
      return MediaQuerySize.s;
    } else if (width <= _breakPointM) {
      return MediaQuerySize.m;
    } else if (width <= _breakPointL) {
      return MediaQuerySize.l;
    } else if (width <= _breakPointXL) {
      return MediaQuerySize.xl;
    } else if (width <= _breakPointXXL) {
      return MediaQuerySize.xxl;
    } else if (width <= _breakPointXXXL) {
      return MediaQuerySize.xxxl;
    } else if (width <= _breakPointWidescreen) {
      return MediaQuerySize.widescreen;
    } else {
      return MediaQuerySize.ultraWidescreen;
    }
  }
}
