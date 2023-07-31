import "package:giphy_explorer/components/giphy_details/giphy_details_page/giphy_details_page.dart";
import "package:giphy_explorer/components/giphy_details/giphy_details_page/giphy_details_page_model.dart";
import "package:giphy_explorer/components/meme_details/meme_details_page/meme_details_page.dart";
import "package:giphy_explorer/components/meme_details/meme_details_page/meme_details_page_model.dart";
import "package:giphy_explorer/components/search/search_page/search_page.dart";
import "package:giphy_explorer/components/search/search_page/search_page_model.dart";
import "package:giphy_explorer/services/routing/irouter.dart";
import "package:giphy_explorer/services/routing/route_configuration.dart";
import "package:giphy_explorer/services/routing/router_base.dart";

class Router extends RouterBase implements IRouter {
  static const String _giphId = "giphId";
  static const String _giphyDetailsPageRouteName = "giphyDetails";
  static const String _giphyDetailsPageRoutePath = "/giph/:$_giphId";
  static const String _memeDetailsPageRouteName = "memeDetails";
  static const String _memeDetailsPageRoutePath = "/meme/:$_memeUrl";
  static const String _memeUrl = "memeUrl";
  static const String _searchMode = "searchMode";
  static const String _searchPageRouteName = "searchPage";
  static const String _searchPageRoutePath = "/search/:$_searchMode";

  @override
  String getInitialRoute() {
    return _searchPageRoutePath.replaceAll(":$_searchMode", "giph");
  }

  @override
  List<RouteConfig> getRoutes(ModelType Function<ModelType extends Object>() modelFactory) {
    return [
      RouteConfig(_searchPageRouteName, _searchPageRoutePath, () => modelFactory<SearchPageModel>(), (model, parameters) => _setSearchDetailsParameters(model as SearchPageModel, parameters), (model) => SearchPage(model as SearchPageModel),
          isInitialRoute: true, isErrorRoute: true),
      RouteConfig(_giphyDetailsPageRouteName, _giphyDetailsPageRoutePath, () => modelFactory<GiphyDetailsPageModel>(), (model, parameters) => _setGiphyDetailsParameters(model as GiphyDetailsPageModel, parameters),
          (model) => GiphyDetailsPage(model as GiphyDetailsPageModel)),
      RouteConfig(_memeDetailsPageRouteName, _memeDetailsPageRoutePath, () => modelFactory<MemeDetailsPageModel>(), (model, parameters) => _setMemeDetailsParameters(model as MemeDetailsPageModel, parameters),
          (model) => MemeDetailsPage(model as MemeDetailsPageModel)),
    ];
  }

  @override
  void goToGiphyDetailsPageRoute(String giphId) {
    goTo(_giphyDetailsPageRouteName, routeParameters: {_giphId: giphId});
  }

  @override
  void goToHomePageRoute(String searchMode) {
    goTo(_searchPageRouteName, routeParameters: {_searchMode: searchMode});
  }

  @override
  void goToMemeDetailsPageRoute(String memeUrl) {
    goTo(_memeDetailsPageRouteName, routeParameters: {_memeUrl: memeUrl});
  }

  @override
  bool get isGiphyDetailsPageRouteActive => activeRouteName == _giphyDetailsPageRouteName;

  @override
  bool get isHomePageRouteActive => activeRouteName == _searchPageRouteName;

  @override
  bool get isMemeDetailsPageRouteActive => activeRouteName == _memeDetailsPageRouteName;

  GiphyDetailsPageModel _setGiphyDetailsParameters(GiphyDetailsPageModel model, Map<String, String> parameters) {
    var giphId = parameters[_giphId];

    model.setParameters(giphId);

    return model;
  }

  MemeDetailsPageModel _setMemeDetailsParameters(MemeDetailsPageModel model, Map<String, String> parameters) {
    var memeUrl = parameters[_memeUrl];

    model.setParameters(memeUrl);

    return model;
  }

  SearchPageModel _setSearchDetailsParameters(SearchPageModel model, Map<String, String> parameters) {
    var searchMode = parameters[_searchMode] ?? "giph";

    model.setParameters(searchMode);

    return model;
  }
}
