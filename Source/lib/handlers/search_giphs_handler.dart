import "package:giphy_explorer/services/giphy/basic_giph_information.dart";
import "package:giphy_explorer/services/giphy/i_giphy_api_client.dart";
import "package:giphy_explorer/services/giphy/paged_list.dart";

class SearchGiphsHandler {
  final IGiphyApiClient _giphyApiClient;

  SearchGiphsHandler(this._giphyApiClient);

  Future<PagedList<BasicGiphInformation>> handle(String keywords, int pageSize, int page) async {
    return await _giphyApiClient.searchGiphs(keywords, pageSize, page);
  }
}
