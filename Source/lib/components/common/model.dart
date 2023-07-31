import "package:flutter/widgets.dart";

abstract class Model extends ChangeNotifier {
  void changed() {
    notifyListeners();
  }
}
