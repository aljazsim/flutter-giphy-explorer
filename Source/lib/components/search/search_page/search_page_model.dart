import "package:giphy_explorer/components/common/page_model.dart";
import "package:giphy_explorer/components/search/search_page_giph_list/search_page_giph_list_model.dart";
import "package:giphy_explorer/services/giphy/basic_giph_information.dart";
import "package:giphy_explorer/services/giphy/paged_list.dart";
import "package:giphy_explorer/services/joke/basic_joke_information.dart";
import "package:giphy_explorer/services/meme/basic_meme_information.dart";

import "../search_page_joke_list/search_page_joke_list_model.dart";
import "../search_page_meme_list/search_page_meme_list_model.dart";

class SearchPageModel extends PageModel {
  final SearchPageGiphListModel _giphListModel = SearchPageGiphListModel();
  final SearchPageJokeListModel _jokeListModel = SearchPageJokeListModel();
  final SearchPageMemeListModel _memeListModel = SearchPageMemeListModel();
  final List<String> _searchHistory = [];
  String _searchMode = "giph";

  Future<PagedList<BasicGiphInformation>> Function(String keywords, int pageSize, int page)? onSearchGiphs;
  Future<List<BasicMemeInformation>> Function(String keywords)? onSearchMemes;
  Future<List<BasicJokeInformation>> Function(String keywords, int count)? onSearchJokes;
  void Function(String giphId)? onShowGiphDetails;
  void Function(String memeUrl)? onShowMemeDetails;

  SearchPageModel() {
    _giphListModel.onSearchGiphs = (keywords, pageSize, page) async => await _onSearchGiphs(keywords, pageSize, page);
    _giphListModel.onShowDetails = (giphId) => onShowGiphDetails?.call(giphId);

    _memeListModel.onSearchMemes = (keywords) async => await _onSearchMemes(keywords);
    _memeListModel.onShowDetails = (memeUrl) => onShowMemeDetails?.call(memeUrl);

    _jokeListModel.onSearchJokes = (keywords, count) async => await _onSearchJokes(keywords, count);
  }

  SearchPageGiphListModel get giphListModel => _giphListModel;
  SearchPageJokeListModel get jokeListModel => _jokeListModel;
  SearchPageMemeListModel get memeListModel => _memeListModel;
  List<String> get searchHistory => _searchHistory;
  String get searchMode => _searchMode;

  void clearSearchHistory() {
    _searchHistory.clear();

    changed();
  }

  Future<void> search(String keywords) async {
    if (_searchMode == "giph") {
      _giphListModel.search(keywords, 1);
    } else if (_searchMode == "meme") {
      _memeListModel.search(keywords);
    } else if (_searchMode == "joke") {
      _jokeListModel.search(keywords);
    }
  }

  void setParameters(String searchMode) {
    if (searchMode != _searchMode) {
      _searchMode = searchMode;

      changed();
    }
  }

  void setSearchMode(String searchMode) {
    _searchMode = searchMode;
  }

  Future<PagedList<BasicGiphInformation>> _onSearchGiphs(String keywords, int pageSize, int page) {
    if (!_searchHistory.contains(keywords)) {
      _searchHistory.add(keywords);
      _searchHistory.sort();

      changed();
    }

    return onSearchGiphs?.call(keywords, pageSize, page) ?? Future.value(PagedList<BasicGiphInformation>(0, [], 0, 1, 0));
  }

  Future<List<BasicJokeInformation>> _onSearchJokes(String keywords, int count) {
    if (!_searchHistory.contains(keywords)) {
      _searchHistory.add(keywords);
      _searchHistory.sort();

      changed();
    }

    return onSearchJokes?.call(keywords, count) ?? Future.value(List<BasicJokeInformation>.empty());
  }

  Future<List<BasicMemeInformation>> _onSearchMemes(String keywords) {
    if (!_searchHistory.contains(keywords)) {
      _searchHistory.add(keywords);
      _searchHistory.sort();

      changed();
    }

    return onSearchMemes?.call(keywords) ?? Future.value(List<BasicMemeInformation>.empty());
  }
}
