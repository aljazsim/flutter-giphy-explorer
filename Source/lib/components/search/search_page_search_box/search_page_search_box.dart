import "package:flutter/material.dart";
import "package:giphy_explorer/components/search/search_page_search_box/search_page_search_box_model.dart";
import "package:provider/provider.dart";

class SearchPageSearchBox extends StatelessWidget {
  final SearchPageSearchBoxModel _model;
  final TextEditingController _textEditingController = TextEditingController();

  SearchPageSearchBox(this._model, {super.key}) {
    _textEditingController.text = _model.keywords;
  }

  @override
  Widget build(BuildContext context) {
    if (_textEditingController.text != _model.keywords) {
      _textEditingController.text = _model.keywords;
    }

    return ListenableProvider<SearchPageSearchBoxModel>(
      create: (_) => _model,
      child: Consumer<SearchPageSearchBoxModel>(builder: (context, _, __) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _textEditingController,
            autofocus: true,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Search",
                // search icon
                prefixIcon: (() {
                  if (context.select((SearchPageSearchBoxModel model) => model.canSearch)) {
                    return IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () => _model.setKeywords(_textEditingController.text),
                    );
                  } else {
                    return const IconButton(
                      icon: Icon(Icons.search),
                      onPressed: null,
                    );
                  }
                }()),
                // clear icon
                suffixIcon: (() {
                  if (context.select((SearchPageSearchBoxModel model) => model.canSearch)) {
                    return IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => _model.setKeywords(""),
                    );
                  }
                }())),
            onSubmitted: (value) => _model.setKeywords(value),
          ),
        );
      }),
    );
  }
}
