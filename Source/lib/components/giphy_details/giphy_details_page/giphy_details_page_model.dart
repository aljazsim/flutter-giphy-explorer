import "dart:io";
import "dart:math";
import "dart:typed_data";

import "package:giphy_explorer/components/common/page_model.dart";
import "package:giphy_explorer/services/giphy/detailed_giph_information.dart";
import "package:flutter/services.dart";

class GiphyDetailsPageModel extends PageModel {
  DetailedGiphInformation? _giph;
  String? _giphId;
  bool _isLoading = false;

  void Function()? onGoBack;
  Future<DetailedGiphInformation?> Function(String giphId)? onGetGiphDetails;
  Future<Uint8List?> Function(String imageUrl)? onDownloadImage;

  @override
  Future<void> activate() async {
    if (_giphId == null) {
      _giph = null;
    } else if (_giph?.id != _giphId) {
      _isLoading = true;

      changed();

      _giph = await onGetGiphDetails?.call(_giphId!);
      _isLoading = false;

      changed();
    }
  }

  DetailedGiphInformation? get giph => _giph;
  bool get isLoading => _isLoading;

  void goBack() {
    onGoBack?.call();
  }

  Future<void> setParameters(String? giphId) async {
    _giphId = giphId;
  }

  String formatBytes(String? value) {
    var mb = pow(2, 20);
    var kb = pow(2, 10);
    var gb = pow(2, 30);
    var tb = pow(2, 40);

    if (value != null) {
      var bytes = int.parse((value));

      if (bytes < kb) {
        return "${value}B";
      } else if (bytes < mb) {
        return "${(bytes / kb).floor()}KB";
      } else if (bytes < gb) {
        return "${(bytes / mb).floor()}MB";
      } else if (bytes < tb) {
        return "${(bytes / gb).floor()}GB";
      } else {
        return "${(bytes / tb).floor()}TB";
      }
    }

    return "";
  }

  Future<void> downloadImage(String filePath, String imageUrl) async {
    var imageBytes = await onDownloadImage?.call(imageUrl);

    var file = await File(filePath).create();
    await file.writeAsBytes(imageBytes!);
  }
}
