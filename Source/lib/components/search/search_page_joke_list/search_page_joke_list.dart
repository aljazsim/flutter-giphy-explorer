import "package:flutter/material.dart";
import "package:giphy_explorer/components/search/search_page_empty_list/search_page_empty_list.dart";
import "package:giphy_explorer/components/search/search_page_joke_list/search_page_joke_list_model.dart";
import "package:giphy_explorer/components/search/search_page_search_box/search_page_search_box.dart";
import "package:provider/provider.dart";

class SearchPageJokeList extends StatelessWidget {
  final SearchPageJokeListModel _model;

  const SearchPageJokeList(this._model, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<SearchPageJokeListModel>(
      create: (_) => _model,
      child: Consumer<SearchPageJokeListModel>(builder: (context, _, __) {
        var searchResultsLoading = context.select((SearchPageJokeListModel model) => model.emptyListModel.isLoading);
        var searchResults = context.select((SearchPageJokeListModel model) => model.searchResults);

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // search box
              SearchPageSearchBox(_model.searchBoxModel),
              // search results
              Expanded(
                child: (() {
                  if (searchResults.isEmpty || searchResultsLoading) {
                    return SearchPageEmptyList(_model.emptyListModel);
                  } else {
                    return _showListResults(context);
                  }
                }()),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget _showListResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: _model.searchResults.length,
        itemBuilder: (context, index) {
          var joke = _model.searchResults[index];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  joke.start,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              if (joke.end != null)
                const SizedBox(
                  height: 16,
                ),
              if (joke.end != null)
                Flexible(
                  child: Text(
                    joke.end!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 36,
              ),
              Center(
                child: Row(
                  children: [
                    Flexible(flex: 1, child: Container()),
                    Flexible(
                      flex: 2,
                      child: SizedBox(
                        height: 1,
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    Flexible(flex: 1, child: Container()),
                  ],
                ),
              ),
              const SizedBox(
                height: 36,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
