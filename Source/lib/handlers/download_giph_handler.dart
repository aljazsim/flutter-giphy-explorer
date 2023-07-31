import "package:flutter/foundation.dart";
import "package:giphy_explorer/services/giphy/i_giphy_api_client.dart";

class DownloadGiphHandler {
  final IGiphyApiClient _giphApiClient;

  DownloadGiphHandler(this._giphApiClient);

  Future<Uint8List?> handle(String giphUrl) async {
    return _giphApiClient.downloadImage(giphUrl);
  }
}
