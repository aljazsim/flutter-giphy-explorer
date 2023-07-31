import "package:giphy_explorer/services/giphy/basic_giph_information.dart";

class DetailedGiphInformation extends BasicGiphInformation {
  String created;
  String embedUrl;
  String size;
  String source;
  String type;
  String? userAvatarUrl;
  String? userDescription;
  String? userDisplayName;
  String? userProfileUrl;
  String? username;

  DetailedGiphInformation(
      String id, String title, String width, String height, String url, this.size, this.type, this.username, this.userDisplayName, this.userDescription, this.userProfileUrl, this.userAvatarUrl, this.created, this.source, this.embedUrl)
      : super(id, title, width, height, url);
}
