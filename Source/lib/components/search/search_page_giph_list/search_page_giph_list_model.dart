import "dart:async";
import "package:giphy_explorer/components/assets/icon_assets.dart";
import "package:giphy_explorer/components/common/model.dart";
import "package:giphy_explorer/components/search/search_page_empty_list/search_page_empty_list_model.dart";
import "package:giphy_explorer/components/search/search_page_image/search_page_image_model.dart";
import "package:giphy_explorer/components/search/search_page_search_box/search_page_search_box_model.dart";
import "package:giphy_explorer/services/giphy/basic_giph_information.dart";
import "package:giphy_explorer/services/giphy/paged_list.dart";

class SearchPageGiphListModel extends Model {
  final SearchPageEmptyListModel _emptyListModel = SearchPageEmptyListModel("Giphs", IconAssets.kangaroo);
  final SearchPageSearchBoxModel _searchBoxModel = SearchPageSearchBoxModel();
  final int _searchResultPageSize = 25;
  List<SearchPageImageModel> _searchResults = [];
  int _searchResultsPage = 0;
  int _searchResultsPageMax = 0;

  Future<PagedList<BasicGiphInformation>> Function(String searchKeywords, int pageSize, int page)? onSearchGiphs;
  void Function(String giphId)? onShowDetails;

  SearchPageGiphListModel() {
    _searchBoxModel.onKeywordsChanged = (keywords) => search(keywords, 1);
  }

  SearchPageEmptyListModel get emptyListModel => _emptyListModel;
  SearchPageSearchBoxModel get searchBoxModel => _searchBoxModel;
  List<SearchPageImageModel> get searchResults => _searchResults;
  int get searchResultsPage => _searchResultsPage;
  int get searchResultsPageMax => _searchResultsPageMax;

  Future<void> search(String keywords, int page) async {
    if (!_emptyListModel.isLoading) {
      if (keywords.isEmpty) {
        _searchResultsPage = 0;
        _searchResultsPageMax = 0;
        _searchResults = [];
        _searchBoxModel.setKeywords("");

        changed();
      } else if (keywords != _searchBoxModel.keywords && page == 1) {
        _searchResultsPage = 1;
        _searchResultsPageMax = 0;
        _searchResults = [];
        _searchBoxModel.setKeywords(keywords);

        changed();
      } else {
        _emptyListModel.setIsLoading(true);
        _searchResultsPage = page;

        changed();

        var searchGiphsResponse = await onSearchGiphs!.call(keywords, _searchResultPageSize, page);

        _emptyListModel.setIsLoading(false);

        _searchResultsPage = searchGiphsResponse.page;
        _searchResultsPageMax = searchGiphsResponse.totalPageCount;

        if (searchResultsPage == 1) {
          _searchResults = searchGiphsResponse.items.map((item) => _mapSearchPageImageModel(item)).toList();
        } else {
          _searchResults += searchGiphsResponse.items.map((item) => _mapSearchPageImageModel(item)).toList();
        }

        changed();
      }
    }
  }

  SearchPageImageModel _mapSearchPageImageModel(BasicGiphInformation item) {
    var model = SearchPageImageModel(item.url, item.title, IconAssets.kangaroo);

    model.onSelected = () => onShowDetails?.call(item.id);

    return model;
  }
}
