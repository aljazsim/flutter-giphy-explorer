import "package:flutter/material.dart";
import "package:giphy_explorer/components/common/page_model.dart";
import "package:go_router/go_router.dart";

class AppModel extends PageModel {
  ThemeData Function()? onGetTheme;
  GoRouter Function()? onGetRouter;

  GoRouter? getRouter() {
    return onGetRouter?.call();
  }

  ThemeData? getTheme() {
    return onGetTheme?.call();
  }
}
