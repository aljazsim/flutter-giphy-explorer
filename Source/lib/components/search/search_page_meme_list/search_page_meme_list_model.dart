import "dart:async";
import "package:giphy_explorer/components/assets/icon_assets.dart";
import "package:giphy_explorer/components/common/model.dart";
import "package:giphy_explorer/components/search/search_page_empty_list/search_page_empty_list_model.dart";
import "package:giphy_explorer/components/search/search_page_image/search_page_image_model.dart";
import "package:giphy_explorer/components/search/search_page_search_box/search_page_search_box_model.dart";
import "package:giphy_explorer/services/meme/basic_meme_information.dart";

class SearchPageMemeListModel extends Model {
  final SearchPageEmptyListModel _emptyListModel = SearchPageEmptyListModel("Memes", IconAssets.koala);
  final SearchPageSearchBoxModel _searchBoxModel = SearchPageSearchBoxModel();
  List<SearchPageImageModel> _searchResults = [];

  Future<List<BasicMemeInformation>> Function(String keywords)? onSearchMemes;
  void Function(String memeUrl)? onShowDetails;

  SearchPageMemeListModel() {
    _searchBoxModel.onKeywordsChanged = (searchKeywords) => search(searchKeywords);
  }

  SearchPageEmptyListModel get emptyListModel => _emptyListModel;
  SearchPageSearchBoxModel get searchBoxModel => _searchBoxModel;
  List<SearchPageImageModel> get searchResults => _searchResults;

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

      var searchGiphsResponse = await onSearchMemes!.call(keywords);

      _emptyListModel.setIsLoading(false);
      _searchResults = searchGiphsResponse.map((item) => _mapSearchPageImageModel(item)).toList();

      changed();
    }
  }

  SearchPageImageModel _mapSearchPageImageModel(BasicMemeInformation item) {
    var model = SearchPageImageModel(item.url, "", IconAssets.koala);

    model.onSelected = () => onShowDetails?.call(item.url);

    return model;
  }
}
