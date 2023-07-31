import "dart:convert" as convert;
import "package:giphy_explorer/services/joke/basic_joke_information.dart";
import "package:giphy_explorer/services/joke/i_joke_api_client.dart";
import "package:giphy_explorer/services/joke/responses/search_jokes_response.dart" as search_jokes_response;
import "package:http/http.dart" as http;

class JokeApiClient implements IJokeApiClient {
  final String _apiUrl;

  JokeApiClient(this._apiUrl);

  @override
  Future<List<BasicJokeInformation>> searchJokes(String keywords, int count) async {
    var path = "joke/Any";
    var parameters = _getParameters();

    parameters["contains"] = keywords;
    parameters["amount"] = count.toString();
    parameters["blacklistFlags"] = "nsfw,religious,political,racist,sexist,explicit";

    var response = await http.get(Uri.https(_apiUrl, path, parameters));

    if (response.statusCode == 200) {
      var data = search_jokes_response.SearchJokesResponse.fromJson(convert.jsonDecode(response.body) as Map<String, dynamic>);

      return data.jokes?.map((d) => _mapBasicJokeInformation(d)).where((d) => d != null).map((d) => d!).toList() ?? [];
    } else {
      return List<BasicJokeInformation>.empty();
    }
  }

  Map<String, String?> _getParameters() {
    return {};
  }

  BasicJokeInformation? _mapBasicJokeInformation(search_jokes_response.Jokes? data) {
    var start = data?.setup ?? data?.joke;
    var end = data?.delivery;

    if (start != null) {
      return BasicJokeInformation(start, end);
    } else {
      return null;
    }
  }
}
