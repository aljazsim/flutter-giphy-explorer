import "dart:math" as math;
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:giphy_explorer/components/search/search_page_image/search_page_image_model.dart";
import "package:provider/provider.dart";

class SearchPageImage extends StatefulWidget {
  final SearchPageImageModel _model;

  const SearchPageImage(this._model, {super.key});

  @override
  State<SearchPageImage> createState() => _SearchPageImageState();
}

class _SearchPageImageState extends State<SearchPageImage> with TickerProviderStateMixin {
  AnimationController? _opacityAnimationController;
  AnimationController? _rotationAnimationController;
  ImageInfo? _imageInfo;
  ImageStream? _imageStream;
  Animation<double>? _opacityAnimation;
  Animation<double>? _rotationAnimation;
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<SearchPageImageModel>(
      create: (_) => widget._model,
      child: Consumer<SearchPageImageModel>(builder: (context, _, __) {
        var isLoaded = context.select((SearchPageImageModel model) => model.isLoaded);
        return ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: (() {
              if (isLoaded && _imageInfo != null) {
                return Opacity(
                  opacity: _opacityAnimation!.value,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: RawImage(
                        image: _imageInfo!.image,
                        fit: BoxFit.cover,
                      ),
                      onTap: () => widget._model.select(),
                    ),
                  ),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Center(
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  value: context.select((SearchPageImageModel model) => model.loaded),
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Transform.rotate(
                                  angle: _rotationAnimation!.value,
                                  child: SvgPicture.asset(widget._model.icon),
                                ),
                              ),
                            )
                          ],
                        ),
                        if (widget._model.title.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Text(
                              widget._model.title,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                      ],
                    ),
                  ),
                );
              }
            }()));
      }),
    );
  }

  @override
  void dispose() {
    _opacityAnimationController?.dispose();
    _opacityAnimationController = null;
    _rotationAnimationController?.dispose();
    _rotationAnimationController = null;
    _imageInfo?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _rotationAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3500));
    _rotationAnimationController!.addListener(() => setState(() {}));
    _rotationAnimationController!.repeat(reverse: true);
    _rotationAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0, end: 0.5 * math.pi), weight: 1),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.5 * math.pi, end: -0.5 * math.pi), weight: 1),
      TweenSequenceItem<double>(tween: Tween<double>(begin: -0.5 * math.pi, end: 0), weight: 1),
    ]).animate(CurvedAnimation(parent: _rotationAnimationController!, curve: Curves.easeInOut));
    _opacityAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _opacityAnimationController!.addListener(() => setState(() {}));
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _opacityAnimationController!, curve: Curves.easeIn));
    _imageStream = NetworkImage(widget._model.url).resolve(const ImageConfiguration());
    _imageStream!.addListener(
      ImageStreamListener(
        (info, _) => _onImageLoaded(info),
        onChunk: (event) => _onImageLoading(event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1)),
      ),
    );
  }

  void _onImageLoaded(ImageInfo info) {
    if (_imageInfo == null) {
      _imageInfo = info;
      widget._model.setIsLoaded(true);
      _opacityAnimationController?.forward(from: 0);
    } else {
      _imageInfo = info;
    }
  }

  void _onImageLoading(double loaded) {
    widget._model.setLoaded(loaded);
  }
}
