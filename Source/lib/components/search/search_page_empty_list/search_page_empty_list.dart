import "dart:math" as math;

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:giphy_explorer/components/search/search_page_empty_list/search_page_empty_list_model.dart";
import "package:giphy_explorer/helpers/media_query_helper.dart";
import "package:provider/provider.dart";

class SearchPageEmptyList extends StatefulWidget {
  final SearchPageEmptyListModel _model;

  const SearchPageEmptyList(this._model, {super.key});

  @override
  State<SearchPageEmptyList> createState() {
    return _SearchPageEmptyListState();
  }
}

class _SearchPageEmptyListState extends State<SearchPageEmptyList> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _opacityAnimation;
  Animation<double>? _rotationAnimation;
  Animation<double>? _sizeAnimation;
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<SearchPageEmptyListModel>(
      create: (_) => widget._model,
      child: Consumer<SearchPageEmptyListModel>(
        builder: (context, _, __) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget._model.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQueryHelper.get(context, [30, 50, 70]),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQueryHelper.get(context, [150, 200, 300]),
                  height: MediaQueryHelper.get(context, [150, 200, 300]),
                  child: Center(
                    child: Opacity(
                      opacity: _opacityAnimation!.value,
                      child: Container(
                        width: MediaQueryHelper.get(context, [150, 200, 300]) * _sizeAnimation!.value,
                        height: MediaQueryHelper.get(context, [150, 200, 300]) * _sizeAnimation!.value,
                        padding: EdgeInsets.all(MediaQueryHelper.get(context, [25, 50, 75]) * _sizeAnimation!.value),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        child: Transform.rotate(
                          angle: _rotationAnimation!.value,
                          child: SvgPicture.asset(widget._model.icon),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _animationController = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget._model.onIsLoadingChanged = (isLoading) => _onIsLoadingChanged(isLoading);
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3500));
    _animationController!.addListener(() => setState(() {}));
    _rotationAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0, end: 0.5 * math.pi), weight: 1),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.5 * math.pi, end: -0.5 * math.pi), weight: 1),
      TweenSequenceItem<double>(tween: Tween<double>(begin: -0.5 * math.pi, end: 0), weight: 1),
    ]).animate(CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut));
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1, end: 0.6), weight: 1),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.6, end: 1), weight: 1),
    ]).animate(CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut));
    _opacityAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1, end: 0.2), weight: 1),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.6, end: 1), weight: 1),
    ]).animate(CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut));
  }

  void _onIsLoadingChanged(bool isLoading) {
    if (isLoading && _animationController?.isAnimating == false) {
      _animationController!.repeat(reverse: true);
    } else if (!isLoading && _animationController?.isAnimating == true) {
      _animationController!.stop();
      _animationController!.reset();
    }
  }
}
