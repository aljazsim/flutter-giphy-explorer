import "package:flutter/widgets.dart";
import "package:giphy_explorer/components/common/page_model.dart";

class RouteConfig {
  PageModel Function() getModel;
  Widget Function(PageModel model) getWidget;
  bool isErrorRoute;
  bool isInitialRoute;
  String name;
  String path;
  PageModel Function(PageModel model, Map<String, String> parameters)? setParameters;

  RouteConfig(this.name, this.path, this.getModel, this.setParameters, this.getWidget, {this.isInitialRoute = false, this.isErrorRoute = false});
}
