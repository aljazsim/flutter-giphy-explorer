import "package:giphy_explorer/services/giphy/detailed_giph_information.dart";
import "package:giphy_explorer/services/giphy/i_giphy_api_client.dart";

class GetGiphDetailsHandler {
  final IGiphyApiClient _giphApiClient;

  GetGiphDetailsHandler(this._giphApiClient);

  Future<DetailedGiphInformation?> handle(String giphId) async {
    return await _giphApiClient.getGiphInformation(giphId);
  }
}
