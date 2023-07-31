import "dart:convert" as convert;
import "package:giphy_explorer/services/meme/basic_meme_information.dart";
import "package:giphy_explorer/services/meme/i_meme_api_client.dart";
import "package:giphy_explorer/services/meme/responses/search_memes_response.dart" as search_memes_response;
import "package:http/http.dart" as http;

class MemeApiClient implements IMemeApiClient {
  final String _apiUrl;

  MemeApiClient(this._apiUrl);

  @override
  Future<List<BasicMemeInformation>> searchMemes(String searchKeywords) async {
    var path = "images";
    var parameters = _getParameters();

    parameters["filter"] = searchKeywords;

    var response = await http.get(Uri.https(_apiUrl, path, parameters));

    if (response.statusCode == 200) {
      return (convert.jsonDecode(response.body) as List<dynamic>)
          .map((item) => search_memes_response.SearchMemesResponse.fromJson(item))
          .map((item) => _mapBasicMemeInformation(item))
          .where((item) => item != null)
          .map((item) => item as BasicMemeInformation)
          .toList();
    } else {
      return List<BasicMemeInformation>.empty();
    }
  }

  Map<String, String?> _getParameters() {
    return {};
  }

  BasicMemeInformation? _mapBasicMemeInformation(search_memes_response.SearchMemesResponse? data) {
    var url = data?.url;

    if (url != null) {
      return BasicMemeInformation(url);
    } else {
      return null;
    }
  }
}
