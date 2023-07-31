class Configuration {
  String? version;
  Giphy? giphy;
  Meme? meme;
  Meme? joke;

  Configuration({this.version, this.giphy, this.meme, this.joke});

  Configuration.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    giphy = json['giphy'] != null ? new Giphy.fromJson(json['giphy']) : null;
    meme = json['meme'] != null ? new Meme.fromJson(json['meme']) : null;
    joke = json['joke'] != null ? new Meme.fromJson(json['joke']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    if (this.giphy != null) {
      data['giphy'] = this.giphy!.toJson();
    }
    if (this.meme != null) {
      data['meme'] = this.meme!.toJson();
    }
    if (this.joke != null) {
      data['joke'] = this.joke!.toJson();
    }
    return data;
  }
}

class Giphy {
  String? apiKey;
  String? apiUrl;

  Giphy({this.apiKey, this.apiUrl});

  Giphy.fromJson(Map<String, dynamic> json) {
    apiKey = json['apiKey'];
    apiUrl = json['apiUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiKey'] = this.apiKey;
    data['apiUrl'] = this.apiUrl;
    return data;
  }
}

class Meme {
  String? apiUrl;

  Meme({this.apiUrl});

  Meme.fromJson(Map<String, dynamic> json) {
    apiUrl = json['apiUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiUrl'] = this.apiUrl;
    return data;
  }
}
