import "package:giphy_explorer/services/meme/basic_meme_information.dart";

abstract interface class IMemeApiClient {
  Future<List<BasicMemeInformation>> searchMemes(String searchKeywords);
}
