import "package:giphy_explorer/services/routing/irouter.dart";

class GoToGiphSearchPageHandler {
  final IRouter _router;

  GoToGiphSearchPageHandler(this._router);

  void handle() {
    _router.goToHomePageRoute("giph");
  }
}
