import "package:giphy_explorer/components/common/model.dart";

class SearchPageImageModel extends Model {
  final String _icon;
  bool _isLoaded = false;
  double _loaded = 0;
  final String _title;
  final String _url;

  void Function()? _onSelected;

  SearchPageImageModel(this._url, this._title, this._icon);

  String get icon => _icon;
  bool get isLoaded => _isLoaded;
  double get loaded => _loaded;
  String get title => _title;
  String get url => _url;

  set onSelected(void Function() callback) => _onSelected = callback;

  void select() {
    _onSelected?.call();
  }

  void setIsLoaded(bool isLoaded) {
    if (_isLoaded != isLoaded) {
      _isLoaded = isLoaded;

      changed();
    }
  }

  void setLoaded(double loaded) {
    if (_loaded != loaded) {
      _loaded = loaded;

      changed();
    }
  }
}
