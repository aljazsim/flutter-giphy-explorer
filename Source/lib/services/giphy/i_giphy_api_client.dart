import "dart:typed_data";
import "package:giphy_explorer/services/giphy/basic_giph_information.dart";
import "package:giphy_explorer/services/giphy/detailed_giph_information.dart";
import "package:giphy_explorer/services/giphy/paged_list.dart";

abstract interface class IGiphyApiClient {
  Future<PagedList<BasicGiphInformation>> searchGiphs(String searchKeywords, int pageSize, int page);
  Future<DetailedGiphInformation?> getGiphInformation(String giphId);
  Future<Uint8List?> downloadImage(String imageUrl);
}
