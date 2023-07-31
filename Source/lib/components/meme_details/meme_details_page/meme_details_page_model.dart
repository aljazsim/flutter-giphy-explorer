import "dart:io";
import "dart:typed_data";

import "package:giphy_explorer/components/common/page_model.dart";
import "package:flutter/services.dart";

class MemeDetailsPageModel extends PageModel {
  String? _memeUrl;

  void Function()? onGoBack;
  Future<Uint8List?> Function(String imageUrl)? onDownloadImage;

  String? get memeUrl => _memeUrl;

  Future<void> downloadImage(String filePath, String imageUrl) async {
    var imageBytes = await onDownloadImage?.call(imageUrl);

    var file = await File(filePath).create();
    await file.writeAsBytes(imageBytes!);
  }

  void goBack() {
    onGoBack?.call();
  }

  Future<void> setParameters(String? memeUrl) async {
    _memeUrl = memeUrl;
  }
}
