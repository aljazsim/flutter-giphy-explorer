class SearchMemesResponse {
  String? _url;
  String? _template;

  SearchMemesResponse({String? url, String? template}) {
    if (url != null) {
      this._url = url;
    }
    if (template != null) {
      this._template = template;
    }
  }

  String? get url => _url;
  set url(String? url) => _url = url;
  String? get template => _template;
  set template(String? template) => _template = template;

  SearchMemesResponse.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
    _template = json['template'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this._url;
    data['template'] = this._template;
    return data;
  }
}
