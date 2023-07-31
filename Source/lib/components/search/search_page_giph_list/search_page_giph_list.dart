import "dart:async";

import "package:flutter/material.dart";
import "package:giphy_explorer/components/search/search_page_empty_list/search_page_empty_list.dart";
import "package:giphy_explorer/components/search/search_page_giph_list/search_page_giph_list_model.dart";
import "package:giphy_explorer/components/search/search_page_image/search_page_image.dart";
import "package:giphy_explorer/components/search/search_page_image/search_page_image_model.dart";
import "package:giphy_explorer/components/search/search_page_search_box/search_page_search_box.dart";
import "package:giphy_explorer/helpers/media_query_helper.dart";
import "package:provider/provider.dart";

class SearchPageGiphList extends StatelessWidget {
  final SearchPageGiphListModel _model;
  final ScrollController _scrollController = ScrollController();

  SearchPageGiphList(this._model, {super.key}) {
    _scrollController.addListener(() async => await _onScroll());
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<SearchPageGiphListModel>(
      create: (_) => _model,
      child: Consumer<SearchPageGiphListModel>(builder: (context, _, __) {
        var searchResultsLoading = context.select((SearchPageGiphListModel model) => model.emptyListModel.isLoading);
        var searchResults = context.select((SearchPageGiphListModel model) => model.searchResults);
        var searchPage = context.select((SearchPageGiphListModel model) => model.searchResultsPage);

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // search box
              SearchPageSearchBox(_model.searchBoxModel),
              // search results
              Expanded(
                child: (() {
                  if (searchResults.isEmpty || (searchResultsLoading && searchPage == 1)) {
                    return SearchPageEmptyList(_model.emptyListModel);
                  } else {
                    return _showListResults(context, searchResults, searchPage);
                  }
                }()),
              )
            ],
          ),
        );
      }),
    );
  }

  Future _onScroll() async {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
      // scrolled almost to the end -> load more
      if (_model.searchResultsPage < _model.searchResultsPageMax) {
        await _model.search(_model.searchBoxModel.keywords, _model.searchResultsPage + 1);
      }
    }
  }

  Widget _showListResults(BuildContext context, List<SearchPageImageModel> models, int page) {
    if (_scrollController.positions.isNotEmpty && _scrollController.position.pixels > 0 && page == 1) {
      _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    }

    return GridView.count(
      primary: false,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      crossAxisCount: MediaQueryHelper.get(context, [1, 1, 2, 3, 4, 5, 6, 7, 8]),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      controller: _scrollController,
      children: List.generate(models.length, (index) => SearchPageImage(models[index])),
    );
  }
}
