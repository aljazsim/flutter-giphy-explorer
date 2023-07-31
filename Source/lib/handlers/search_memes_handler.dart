import "package:giphy_explorer/services/meme/basic_meme_information.dart";
import "package:giphy_explorer/services/meme/i_meme_api_client.dart";

class SearchMemesHandler {
  final IMemeApiClient _memeApiClient;

  SearchMemesHandler(this._memeApiClient);

  Future<List<BasicMemeInformation>> handle(String searchKeywords) async {
    return await _memeApiClient.searchMemes(searchKeywords);
  }
}
