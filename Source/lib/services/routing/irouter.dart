import "package:giphy_explorer/services/routing/irouter_base.dart";

abstract interface class IRouter implements IRouterBase {
  bool get isHomePageRouteActive;
  bool get isGiphyDetailsPageRouteActive;
  bool get isMemeDetailsPageRouteActive;

  void goToHomePageRoute(String searchMode);
  void goToGiphyDetailsPageRoute(String giphId);
  void goToMemeDetailsPageRoute(String memeUrl);
}
