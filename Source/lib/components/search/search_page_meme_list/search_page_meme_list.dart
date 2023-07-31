import "package:flutter/widgets.dart";
import "package:giphy_explorer/components/search/search_page_empty_list/search_page_empty_list.dart";
import "package:giphy_explorer/components/search/search_page_meme_list/search_page_meme_list_model.dart";
import "package:giphy_explorer/components/search/search_page_search_box/search_page_search_box.dart";
import "package:giphy_explorer/helpers/media_query_helper.dart";
import "package:provider/provider.dart";

import "../search_page_image/search_page_image.dart";

class SearchPageMemeList extends StatelessWidget {
  final SearchPageMemeListModel _model;

  const SearchPageMemeList(this._model, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<SearchPageMemeListModel>(
      create: (_) => _model,
      child: Consumer<SearchPageMemeListModel>(builder: (context, _, __) {
        var searchResultsLoading = context.select((SearchPageMemeListModel model) => model.emptyListModel.isLoading);
        var searchResults = context.select((SearchPageMemeListModel model) => model.searchResults);

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
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      crossAxisCount: MediaQueryHelper.get(context, [1, 1, 2, 3, 4, 5, 6, 7, 8]),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: List.generate(_model.searchResults.length, (index) => SearchPageImage(_model.searchResults[index])),
    );
  }
}
