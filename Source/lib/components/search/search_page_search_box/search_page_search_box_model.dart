import "package:giphy_explorer/components/common/model.dart";

class SearchPageSearchBoxModel extends Model {
  String _keywords = "";

  void Function(String searchKeywords)? onKeywordsChanged;

  bool get canSearch => _keywords.isNotEmpty;
  String get keywords => _keywords;

  void setKeywords(String searchKeywords) {
    if (searchKeywords != _keywords) {
      _keywords = searchKeywords;

      onKeywordsChanged?.call(_keywords);

      changed();
    }
  }
}
