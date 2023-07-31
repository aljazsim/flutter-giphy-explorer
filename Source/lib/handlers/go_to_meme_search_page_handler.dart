import "package:giphy_explorer/services/routing/irouter.dart";

class GoToMemeSearchPageHandler {
  final IRouter _router;

  GoToMemeSearchPageHandler(this._router);

  void handle() {
    _router.goToHomePageRoute("meme");
  }
}
