import "package:giphy_explorer/services/joke/basic_joke_information.dart";

abstract interface class IJokeApiClient {
  Future<List<BasicJokeInformation>> searchJokes(String keywords, int count);
}
