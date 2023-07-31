import "dart:async";

import "package:giphy_explorer/components/common/model.dart";

abstract class PageModel extends Model {
  Future<void> activate() {
    return Future.value();
  }

  Future<void> deactivate() {
    return Future.value();
  }
}
