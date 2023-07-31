import "package:giphy_explorer/services/joke/basic_joke_information.dart";
import "package:giphy_explorer/services/joke/i_joke_api_client.dart";

class SearchJokesHandler {
  final IJokeApiClient _jokeApiClient;

  SearchJokesHandler(this._jokeApiClient);

  Future<List<BasicJokeInformation>> handle(String keywords, int count) async {
    return await _jokeApiClient.searchJokes(keywords, count);
  }
}
