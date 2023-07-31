import "dart:convert" as convert;
import "dart:typed_data";
import "package:giphy_explorer/services/giphy/basic_giph_information.dart";
import "package:giphy_explorer/services/giphy/detailed_giph_information.dart";
import "package:giphy_explorer/services/giphy/i_giphy_api_client.dart";
import "package:giphy_explorer/services/giphy/paged_list.dart";
import "package:giphy_explorer/services/giphy/responses/get_giph_information_response.dart" as get_giph_information_response;
import "package:giphy_explorer/services/giphy/responses/search_giphs_response.dart" as search_giphs_response;
import "package:http/http.dart" as http;

class GiphyApiClient implements IGiphyApiClient {
  final String _apiKey;
  final String _apiUrl;

  GiphyApiClient(this._apiUrl, this._apiKey);

  @override
  Future<Uint8List?> downloadImage(String imageUrl) async {
    var response = await http.get(Uri.parse(imageUrl), headers: {"responseType": "arraybuffer"});

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return null;
    }
  }

  @override
  Future<DetailedGiphInformation?> getGiphInformation(String giphId) async {
    var path = "v1/gifs/$giphId";
    var parameters = _getParameters();

    parameters["gif_id"] = giphId;

    var response = await http.get(Uri.https(_apiUrl, path, parameters));

    if (response.statusCode == 200) {
      var data = get_giph_information_response.GetGiphInformationResponse.fromJson(convert.jsonDecode(response.body) as Map<String, dynamic>);

      return _mapDetailedGiphInformation(data.data);
    } else {
      return null;
    }
  }

  @override
  Future<PagedList<BasicGiphInformation>> searchGiphs(String keywords, int pageSize, int page) async {
    var path = "v1/gifs/search";
    var parameters = _getParameters();

    parameters["limit"] = pageSize.toString();
    parameters["offset"] = (pageSize * (page - 1)).toString();
    parameters["q"] = keywords;

    var response = await http.get(Uri.https(_apiUrl, path, parameters));

    if (response.statusCode == 200) {
      var data = search_giphs_response.SearchGiphsResponse.fromJson(convert.jsonDecode(response.body) as Map<String, dynamic>);

      var totalItemCount = data.pagination?.totalCount ?? 0;
      var totalPageCount = (totalItemCount / pageSize).ceil();
      var giphs = data.data?.map((d) => _mapBasicGiphInformation(d)).where((d) => d != null).map((d) => d!).toList() ?? [];

      return PagedList<BasicGiphInformation>(totalItemCount, giphs, totalPageCount, page, pageSize);
    } else {
      return PagedList<BasicGiphInformation>(0, [], 0, 1, pageSize);
    }
  }

  Map<String, String?> _getParameters() {
    return {"api_key": _apiKey};
  }

  BasicGiphInformation? _mapBasicGiphInformation(search_giphs_response.Data data) {
    var id = data.id;
    var title = data.title;
    var images = data.images;
    var fixedWidth = data.images!.fixedWidth;
    var width = data.images!.fixedWidth!.width;
    var height = data.images!.fixedWidth!.height;
    var url = data.images!.fixedWidth!.url;

    if (id != null && title != null && images != null && fixedWidth != null && width != null && height != null && url != null) {
      return BasicGiphInformation(id, title, width, height, url);
    } else {
      return null;
    }
  }

  DetailedGiphInformation? _mapDetailedGiphInformation(get_giph_information_response.Data? data) {
    var giph = data;
    var giphId = data?.id;
    var width = giph?.images?.original?.width;
    var height = giph?.images?.original?.height;
    var size = giph?.images?.original?.size;
    var url = giph?.images?.original?.url;
    var type = "gif";
    var title = giph?.title;
    var username = giph?.username;
    var userDisplayName = giph?.user?.displayName;
    var userDescription = giph?.user?.description;
    var userProfileUrl = giph?.user?.profileUrl;
    var userAvatarUrl = giph?.user?.avatarUrl;
    var created = giph?.importDatetime;
    var source = giph?.source;
    var embedUrl = giph?.embedUrl;

    if (giphId != null && width != null && height != null && size != null && url != null && title != null && created != null && source != null && embedUrl != null) {
      return DetailedGiphInformation(giphId, title, width, height, url, size, type, username!, userDisplayName, userDescription, userProfileUrl, userAvatarUrl, created, source, embedUrl);
    } else {
      return null;
    }
  }
}
