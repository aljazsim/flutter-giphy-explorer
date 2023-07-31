import "package:giphy_explorer/services/routing/irouter.dart";

class ShowMemeDetailsHandler {
  final IRouter _router;

  ShowMemeDetailsHandler(this._router);

  void handle(String memeUrl) {
    _router.goToMemeDetailsPageRoute(memeUrl);
  }
}
