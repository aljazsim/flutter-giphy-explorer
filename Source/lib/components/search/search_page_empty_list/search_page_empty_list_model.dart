import "package:giphy_explorer/components/common/model.dart";

class SearchPageEmptyListModel extends Model {
  final String _icon;
  bool _isLoading = false;
  final String _title;

  SearchPageEmptyListModel(this._title, this._icon);

  bool get isLoading => _isLoading;
  String get title => _title;
  String get icon => _icon;

  void Function(bool)? onIsLoadingChanged;

  void setIsLoading(bool isLoading) {
    if (isLoading != _isLoading) {
      _isLoading = isLoading;

      onIsLoadingChanged?.call(isLoading);

      changed();
    }
  }
}
