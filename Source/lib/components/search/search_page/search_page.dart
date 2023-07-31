import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:giphy_explorer/components/assets/icon_assets.dart";
import "package:giphy_explorer/components/search/search_page/search_page_model.dart";
import "package:giphy_explorer/components/search/search_page_giph_list/search_page_giph_list.dart";
import "package:giphy_explorer/components/search/search_page_joke_list/search_page_joke_list.dart";
import "package:giphy_explorer/components/search/search_page_meme_list/search_page_meme_list.dart";
import "package:provider/provider.dart";

class SearchPage extends StatefulWidget {
  final SearchPageModel _model;

  const SearchPage(this._model, {super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  final List<String> _searchModes = ["giph", "meme", "joke"];
  TabController? _tabController;
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<SearchPageModel>(
      create: (_) => widget._model,
      child: Consumer<SearchPageModel>(builder: (context, _, __) {
        var searchMode = context.select((SearchPageModel model) => model.searchMode);
        _tabController!.index = _searchModes.indexOf(searchMode);
        return Scaffold(
          appBar: AppBar(
              title: const Text("Giphy Explorer"),
              titleSpacing: 0,
              leading: Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 14),
                child: SvgPicture.asset(
                  IconAssets.cockatoo,
                ),
              ),
              leadingWidth: 40,
              actions: (() {
                if (context.select((SearchPageModel model) => model.searchHistory.isEmpty)) {
                  return null;
                } else {
                  return [
                    PopupMenuButton(
                      itemBuilder: (context) {
                        var menuItems = List.generate(widget._model.searchHistory.length, (i) => _getHistoryItem(widget._model.searchHistory[i]));
                        menuItems.add(_getClearHistoryItem());
                        return menuItems;
                      },
                    )
                  ];
                }
              }())),
          bottomNavigationBar: _getTabBar(),
          body: TabBarView(
            controller: _tabController,
            children: [
              SearchPageGiphList(widget._model.giphListModel),
              SearchPageMemeList(widget._model.memeListModel),
              SearchPageJokeList(widget._model.jokeListModel),
            ],
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _searchModes.length);
  }

  PopupMenuItem _getClearHistoryItem() {
    return PopupMenuItem(
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.clear,
            size: 16,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text("Clear history"),
        ],
      ),
      onTap: () => widget._model.clearSearchHistory(),
    );
  }

  PopupMenuItem _getHistoryItem(String searchKeywords) {
    return PopupMenuItem(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Icon(
            Icons.search,
            size: 16,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text("Search \"$searchKeywords\""),
        ],
      ),
      onTap: () async => await widget._model.search(searchKeywords),
    );
  }

  Widget _getTabBar() {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: const EdgeInsets.all(1.0),
      indicatorWeight: 10,
      controller: _tabController,
      onTap: (i) => widget._model.setSearchMode(_searchModes[i]),
      tabs: const [
        Tab(
          text: "Giphs",
          icon: Icon(Icons.image),
        ),
        Tab(
          text: "Memes",
          icon: Icon(Icons.image),
        ),
        Tab(
          text: "Jokes",
          icon: Icon(Icons.edit_document),
        ),
      ],
    );
  }
}
