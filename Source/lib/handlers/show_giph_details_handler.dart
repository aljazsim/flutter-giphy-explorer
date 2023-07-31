import "package:giphy_explorer/services/routing/irouter.dart";

class ShowGiphDetailsHandler {
  final IRouter _router;

  ShowGiphDetailsHandler(this._router);

  void handle(String giphId) {
    _router.goToGiphyDetailsPageRoute(giphId);
  }
}
