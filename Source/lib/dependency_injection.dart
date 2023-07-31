import "dart:convert" as convert;

import "package:flutter/services.dart";
import "package:get_it/get_it.dart";
import "package:giphy_explorer/components/app/app_model.dart";
import "package:giphy_explorer/components/common/page_model.dart";
import "package:giphy_explorer/components/giphy_details/giphy_details_page/giphy_details_page_model.dart";
import "package:giphy_explorer/components/meme_details/meme_details_page/meme_details_page_model.dart";
import "package:giphy_explorer/components/search/search_page/search_page_model.dart";
import "package:giphy_explorer/configuration/configuration.dart";
import "package:giphy_explorer/handlers/download_giph_handler.dart";
import "package:giphy_explorer/handlers/get_giph_details_handler.dart";
import "package:giphy_explorer/handlers/go_to_giph_search_page_handler.dart";
import "package:giphy_explorer/handlers/go_to_meme_search_page_handler.dart";
import "package:giphy_explorer/handlers/route_changing_handler.dart";
import "package:giphy_explorer/handlers/search_giphs_handler.dart";
import "package:giphy_explorer/handlers/search_memes_handler.dart";
import "package:giphy_explorer/handlers/show_giph_details_handler.dart";
import "package:giphy_explorer/services/giphy/giphy_api_client.dart";
import "package:giphy_explorer/services/giphy/i_giphy_api_client.dart";
import "package:giphy_explorer/services/joke/i_joke_api_client.dart";
import "package:giphy_explorer/services/joke/joke_api_client.dart";
import "package:giphy_explorer/services/meme/i_meme_api_client.dart";
import "package:giphy_explorer/services/meme/meme_api_client.dart";
import "package:giphy_explorer/services/routing/irouter.dart";
import "package:giphy_explorer/services/routing/router.dart";
import "package:giphy_explorer/style/theme.dart";
import "package:go_router/go_router.dart";

import "handlers/search_jokes_handler.dart";
import "handlers/show_meme_details_handler.dart";

abstract class DependencyInjection {
  static final _diContainer = GetIt.instance;

  static T getInstance<T extends Object>() {
    return _diContainer<T>();
  }

  static void _registerService<T extends Object>(T instance) {
    _diContainer.registerSingleton(instance);
  }

  static void _registerHandler<T extends Object>(T Function() factory) {
    _diContainer.registerFactory(factory);
  }

  static void _registerPageModel<T extends PageModel>(T instance) {
    _diContainer.registerSingleton(instance);
  }

  static void registerJokeApiClient(Configuration configuration) {
    final jokeApiClient = JokeApiClient(configuration.joke!.apiUrl!);

    _registerService<IJokeApiClient>(jokeApiClient);
  }

  static Future<void> setup() async {
    _configureDependencyInjection(await _getConfiguration());
  }

  static void _configureDependencyInjection(final Configuration configuration) async {
    // register services (singletons)
    _registerRouter();
    _registerGiphyApiClient(configuration);
    _registerMemeApiClient(configuration);
    registerJokeApiClient(configuration);

    // register page models (singletons)
    _registerAppModel();
    _registerHomePageModel();
    _registerGiphyDetailsPageModel();
    _registerMemeDetailsPageModel();

    // register handlers (transients)
    _registerHandler(() => RouteChangingHandler(getInstance<IRouter>()));
    _registerHandler(() => ShowGiphDetailsHandler(getInstance<IRouter>()));
    _registerHandler(() => GoToGiphSearchPageHandler(getInstance<IRouter>()));
    _registerHandler(() => GoToMemeSearchPageHandler(getInstance<IRouter>()));
    _registerHandler(() => SearchGiphsHandler(getInstance<IGiphyApiClient>()));
    _registerHandler(() => GetGiphDetailsHandler(getInstance<IGiphyApiClient>()));
    _registerHandler(() => SearchMemesHandler(getInstance<IMemeApiClient>()));
    _registerHandler(() => SearchJokesHandler(getInstance<IJokeApiClient>()));
    _registerHandler(() => DownloadGiphHandler(getInstance<IGiphyApiClient>()));
    _registerHandler(() => ShowMemeDetailsHandler(getInstance<IRouter>()));

    _diContainer.allReady();
  }

  static Future<Configuration> _getConfiguration() async {
    var jsonFilePath = "assets/configuration.json";
    var json = await rootBundle.loadString(jsonFilePath);

    return Configuration.fromJson(convert.jsonDecode(json) as Map<String, dynamic>);
  }

  static void _registerAppModel() {
    final appModel = AppModel();

    appModel.onGetRouter = () => getInstance<GoRouter>();
    appModel.onGetTheme = () => Theme.getTheme();

    _registerPageModel(appModel);
  }

  static void _registerGiphyApiClient(Configuration configuration) {
    final giphyApiClient = GiphyApiClient(configuration.giphy!.apiUrl!, configuration.giphy!.apiKey!);

    _registerService<IGiphyApiClient>(giphyApiClient);
  }

  static void _registerGiphyDetailsPageModel() {
    final giphyDetailsPageModel = GiphyDetailsPageModel();

    giphyDetailsPageModel.onGoBack = () => getInstance<GoToGiphSearchPageHandler>().handle();
    giphyDetailsPageModel.onGetGiphDetails = (giphId) async => await getInstance<GetGiphDetailsHandler>().handle(giphId);
    giphyDetailsPageModel.onDownloadImage = (giphUrl) async => await getInstance<DownloadGiphHandler>().handle(giphUrl);

    _registerPageModel(giphyDetailsPageModel);
  }

  static void _registerHomePageModel() {
    final homePageModel = SearchPageModel();

    homePageModel.onSearchGiphs = (keywords, pageSize, page) async => await getInstance<SearchGiphsHandler>().handle(keywords, pageSize, page);
    homePageModel.onShowGiphDetails = (giphId) => getInstance<ShowGiphDetailsHandler>().handle(giphId);
    homePageModel.onSearchMemes = (keywords) async => await getInstance<SearchMemesHandler>().handle(keywords);
    homePageModel.onShowMemeDetails = (memeUrl) => getInstance<ShowMemeDetailsHandler>().handle(memeUrl);
    homePageModel.onSearchJokes = (keywords, count) async => await getInstance<SearchJokesHandler>().handle(keywords, count);

    _registerPageModel(homePageModel);
  }

  static MemeApiClient _registerMemeApiClient(Configuration configuration) {
    final memeApiClient = MemeApiClient(configuration.meme!.apiUrl!);

    _registerService<IMemeApiClient>(memeApiClient);

    return memeApiClient;
  }

  static void _registerMemeDetailsPageModel() {
    final memeDetailsPageModel = MemeDetailsPageModel();

    memeDetailsPageModel.onGoBack = () => getInstance<GoToMemeSearchPageHandler>().handle();
    memeDetailsPageModel.onDownloadImage = (giphUrl) async => await getInstance<DownloadGiphHandler>().handle(giphUrl);

    _registerPageModel(memeDetailsPageModel);
  }

  static void _registerRouter() {
    final router = Router();

    router.onRouteChanging = (routeName, routeParameters) => getInstance<RouteChangingHandler>().handle(routeName, routeParameters);

    _registerService<IRouter>(router);
    _registerService<GoRouter>(router.configure(<TModel extends Object>() => getInstance<TModel>()));
  }
}
