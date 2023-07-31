import "dart:async";
import "package:giphy_explorer/components/assets/icon_assets.dart";
import "package:giphy_explorer/components/common/model.dart";
import "package:giphy_explorer/components/search/search_page_empty_list/search_page_empty_list_model.dart";
import "package:giphy_explorer/components/search/search_page_search_box/search_page_search_box_model.dart";
import "package:giphy_explorer/services/joke/basic_joke_information.dart";

class SearchPageJokeListModel extends Model {
  final SearchPageEmptyListModel _emptyListModel = SearchPageEmptyListModel("Jokes", IconAssets.elephant);
  final SearchPageSearchBoxModel _searchBoxModel = SearchPageSearchBoxModel();
  final int _searchResultCount = 25;
  List<BasicJokeInformation> _searchResults = [];

  Future<List<BasicJokeInformation>> Function(String keywords, int count)? onSearchJokes;

  SearchPageJokeListModel() {
    _searchBoxModel.onKeywordsChanged = (searchKeywords) => search(searchKeywords);
  }

  SearchPageEmptyListModel get emptyListModel => _emptyListModel;
  SearchPageSearchBoxModel get searchBoxModel => _searchBoxModel;
  List<BasicJokeInformation> get searchResults => _searchResults;

  Future<void> search(String keywords) async {
    if (keywords.isEmpty) {
      _searchResults = [];
      _searchBoxModel.setKeywords("");

      changed();
    } else if (keywords != _searchBoxModel.keywords) {
      _searchResults = [];
      _searchBoxModel.setKeywords(keywords);

      changed();
    } else {
      _emptyListModel.setIsLoading(true);

      changed();

      var searchGiphsResponse = await onSearchJokes!.call(keywords, _searchResultCount);

      _emptyListModel.setIsLoading(false);
      _searchResults = searchGiphsResponse;

      changed();
    }
  }
}
