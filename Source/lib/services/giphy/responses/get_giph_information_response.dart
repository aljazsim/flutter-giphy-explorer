class GetGiphInformationResponse {
  Data? _data;
  Meta? _meta;

  GetGiphInformationResponse({Data? data, Meta? meta}) {
    if (data != null) {
      this._data = data;
    }
    if (meta != null) {
      this._meta = meta;
    }
  }

  Data? get data => _data;
  set data(Data? data) => _data = data;
  Meta? get meta => _meta;
  set meta(Meta? meta) => _meta = meta;

  GetGiphInformationResponse.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    _meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    if (this._meta != null) {
      data['meta'] = this._meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? _type;
  String? _id;
  String? _url;
  String? _slug;
  String? _bitlyGifUrl;
  String? _bitlyUrl;
  String? _embedUrl;
  String? _username;
  String? _source;
  String? _title;
  String? _rating;
  String? _contentUrl;
  String? _sourceTld;
  String? _sourcePostUrl;
  int? _isSticker;
  String? _importDatetime;
  String? _trendingDatetime;
  Images? _images;
  User? _user;
  String? _analyticsResponsePayload;
  Analytics? _analytics;

  Data(
      {String? type,
      String? id,
      String? url,
      String? slug,
      String? bitlyGifUrl,
      String? bitlyUrl,
      String? embedUrl,
      String? username,
      String? source,
      String? title,
      String? rating,
      String? contentUrl,
      String? sourceTld,
      String? sourcePostUrl,
      int? isSticker,
      String? importDatetime,
      String? trendingDatetime,
      Images? images,
      User? user,
      String? analyticsResponsePayload,
      Analytics? analytics}) {
    if (type != null) {
      this._type = type;
    }
    if (id != null) {
      this._id = id;
    }
    if (url != null) {
      this._url = url;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (bitlyGifUrl != null) {
      this._bitlyGifUrl = bitlyGifUrl;
    }
    if (bitlyUrl != null) {
      this._bitlyUrl = bitlyUrl;
    }
    if (embedUrl != null) {
      this._embedUrl = embedUrl;
    }
    if (username != null) {
      this._username = username;
    }
    if (source != null) {
      this._source = source;
    }
    if (title != null) {
      this._title = title;
    }
    if (rating != null) {
      this._rating = rating;
    }
    if (contentUrl != null) {
      this._contentUrl = contentUrl;
    }
    if (sourceTld != null) {
      this._sourceTld = sourceTld;
    }
    if (sourcePostUrl != null) {
      this._sourcePostUrl = sourcePostUrl;
    }
    if (isSticker != null) {
      this._isSticker = isSticker;
    }
    if (importDatetime != null) {
      this._importDatetime = importDatetime;
    }
    if (trendingDatetime != null) {
      this._trendingDatetime = trendingDatetime;
    }
    if (images != null) {
      this._images = images;
    }
    if (user != null) {
      this._user = user;
    }
    if (analyticsResponsePayload != null) {
      this._analyticsResponsePayload = analyticsResponsePayload;
    }
    if (analytics != null) {
      this._analytics = analytics;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get bitlyGifUrl => _bitlyGifUrl;
  set bitlyGifUrl(String? bitlyGifUrl) => _bitlyGifUrl = bitlyGifUrl;
  String? get bitlyUrl => _bitlyUrl;
  set bitlyUrl(String? bitlyUrl) => _bitlyUrl = bitlyUrl;
  String? get embedUrl => _embedUrl;
  set embedUrl(String? embedUrl) => _embedUrl = embedUrl;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get source => _source;
  set source(String? source) => _source = source;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get rating => _rating;
  set rating(String? rating) => _rating = rating;
  String? get contentUrl => _contentUrl;
  set contentUrl(String? contentUrl) => _contentUrl = contentUrl;
  String? get sourceTld => _sourceTld;
  set sourceTld(String? sourceTld) => _sourceTld = sourceTld;
  String? get sourcePostUrl => _sourcePostUrl;
  set sourcePostUrl(String? sourcePostUrl) => _sourcePostUrl = sourcePostUrl;
  int? get isSticker => _isSticker;
  set isSticker(int? isSticker) => _isSticker = isSticker;
  String? get importDatetime => _importDatetime;
  set importDatetime(String? importDatetime) => _importDatetime = importDatetime;
  String? get trendingDatetime => _trendingDatetime;
  set trendingDatetime(String? trendingDatetime) => _trendingDatetime = trendingDatetime;
  Images? get images => _images;
  set images(Images? images) => _images = images;
  User? get user => _user;
  set user(User? user) => _user = user;
  String? get analyticsResponsePayload => _analyticsResponsePayload;
  set analyticsResponsePayload(String? analyticsResponsePayload) => _analyticsResponsePayload = analyticsResponsePayload;
  Analytics? get analytics => _analytics;
  set analytics(Analytics? analytics) => _analytics = analytics;

  Data.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _id = json['id'];
    _url = json['url'];
    _slug = json['slug'];
    _bitlyGifUrl = json['bitly_gif_url'];
    _bitlyUrl = json['bitly_url'];
    _embedUrl = json['embed_url'];
    _username = json['username'];
    _source = json['source'];
    _title = json['title'];
    _rating = json['rating'];
    _contentUrl = json['content_url'];
    _sourceTld = json['source_tld'];
    _sourcePostUrl = json['source_post_url'];
    _isSticker = json['is_sticker'];
    _importDatetime = json['import_datetime'];
    _trendingDatetime = json['trending_datetime'];
    _images = json['images'] != null ? new Images.fromJson(json['images']) : null;
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    _analyticsResponsePayload = json['analytics_response_payload'];
    _analytics = json['analytics'] != null ? new Analytics.fromJson(json['analytics']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['id'] = this._id;
    data['url'] = this._url;
    data['slug'] = this._slug;
    data['bitly_gif_url'] = this._bitlyGifUrl;
    data['bitly_url'] = this._bitlyUrl;
    data['embed_url'] = this._embedUrl;
    data['username'] = this._username;
    data['source'] = this._source;
    data['title'] = this._title;
    data['rating'] = this._rating;
    data['content_url'] = this._contentUrl;
    data['source_tld'] = this._sourceTld;
    data['source_post_url'] = this._sourcePostUrl;
    data['is_sticker'] = this._isSticker;
    data['import_datetime'] = this._importDatetime;
    data['trending_datetime'] = this._trendingDatetime;
    if (this._images != null) {
      data['images'] = this._images!.toJson();
    }
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    data['analytics_response_payload'] = this._analyticsResponsePayload;
    if (this._analytics != null) {
      data['analytics'] = this._analytics!.toJson();
    }
    return data;
  }
}

class Images {
  Original? _original;
  Downsized? _downsized;
  Downsized? _downsizedLarge;
  Downsized? _downsizedMedium;
  DownsizedSmall? _downsizedSmall;
  Downsized? _downsizedStill;
  FixedHeight? _fixedHeight;
  FixedHeightDownsampled? _fixedHeightDownsampled;
  FixedHeight? _fixedHeightSmall;
  Downsized? _fixedHeightSmallStill;
  Downsized? _fixedHeightStill;
  FixedHeight? _fixedWidth;
  FixedHeightDownsampled? _fixedWidthDownsampled;
  FixedHeight? _fixedWidthSmall;
  Downsized? _fixedWidthSmallStill;
  Downsized? _fixedWidthStill;
  Looping? _looping;
  Downsized? _originalStill;
  DownsizedSmall? _originalMp4;
  DownsizedSmall? _preview;
  Downsized? _previewGif;
  Downsized? _previewWebp;
  Downsized? _d480wStill;

  Images(
      {Original? original,
      Downsized? downsized,
      Downsized? downsizedLarge,
      Downsized? downsizedMedium,
      DownsizedSmall? downsizedSmall,
      Downsized? downsizedStill,
      FixedHeight? fixedHeight,
      FixedHeightDownsampled? fixedHeightDownsampled,
      FixedHeight? fixedHeightSmall,
      Downsized? fixedHeightSmallStill,
      Downsized? fixedHeightStill,
      FixedHeight? fixedWidth,
      FixedHeightDownsampled? fixedWidthDownsampled,
      FixedHeight? fixedWidthSmall,
      Downsized? fixedWidthSmallStill,
      Downsized? fixedWidthStill,
      Looping? looping,
      Downsized? originalStill,
      DownsizedSmall? originalMp4,
      DownsizedSmall? preview,
      Downsized? previewGif,
      Downsized? previewWebp,
      Downsized? d480wStill}) {
    if (original != null) {
      this._original = original;
    }
    if (downsized != null) {
      this._downsized = downsized;
    }
    if (downsizedLarge != null) {
      this._downsizedLarge = downsizedLarge;
    }
    if (downsizedMedium != null) {
      this._downsizedMedium = downsizedMedium;
    }
    if (downsizedSmall != null) {
      this._downsizedSmall = downsizedSmall;
    }
    if (downsizedStill != null) {
      this._downsizedStill = downsizedStill;
    }
    if (fixedHeight != null) {
      this._fixedHeight = fixedHeight;
    }
    if (fixedHeightDownsampled != null) {
      this._fixedHeightDownsampled = fixedHeightDownsampled;
    }
    if (fixedHeightSmall != null) {
      this._fixedHeightSmall = fixedHeightSmall;
    }
    if (fixedHeightSmallStill != null) {
      this._fixedHeightSmallStill = fixedHeightSmallStill;
    }
    if (fixedHeightStill != null) {
      this._fixedHeightStill = fixedHeightStill;
    }
    if (fixedWidth != null) {
      this._fixedWidth = fixedWidth;
    }
    if (fixedWidthDownsampled != null) {
      this._fixedWidthDownsampled = fixedWidthDownsampled;
    }
    if (fixedWidthSmall != null) {
      this._fixedWidthSmall = fixedWidthSmall;
    }
    if (fixedWidthSmallStill != null) {
      this._fixedWidthSmallStill = fixedWidthSmallStill;
    }
    if (fixedWidthStill != null) {
      this._fixedWidthStill = fixedWidthStill;
    }
    if (looping != null) {
      this._looping = looping;
    }
    if (originalStill != null) {
      this._originalStill = originalStill;
    }
    if (originalMp4 != null) {
      this._originalMp4 = originalMp4;
    }
    if (preview != null) {
      this._preview = preview;
    }
    if (previewGif != null) {
      this._previewGif = previewGif;
    }
    if (previewWebp != null) {
      this._previewWebp = previewWebp;
    }
    if (d480wStill != null) {
      this._d480wStill = d480wStill;
    }
  }

  Original? get original => _original;
  set original(Original? original) => _original = original;
  Downsized? get downsized => _downsized;
  set downsized(Downsized? downsized) => _downsized = downsized;
  Downsized? get downsizedLarge => _downsizedLarge;
  set downsizedLarge(Downsized? downsizedLarge) => _downsizedLarge = downsizedLarge;
  Downsized? get downsizedMedium => _downsizedMedium;
  set downsizedMedium(Downsized? downsizedMedium) => _downsizedMedium = downsizedMedium;
  DownsizedSmall? get downsizedSmall => _downsizedSmall;
  set downsizedSmall(DownsizedSmall? downsizedSmall) => _downsizedSmall = downsizedSmall;
  Downsized? get downsizedStill => _downsizedStill;
  set downsizedStill(Downsized? downsizedStill) => _downsizedStill = downsizedStill;
  FixedHeight? get fixedHeight => _fixedHeight;
  set fixedHeight(FixedHeight? fixedHeight) => _fixedHeight = fixedHeight;
  FixedHeightDownsampled? get fixedHeightDownsampled => _fixedHeightDownsampled;
  set fixedHeightDownsampled(FixedHeightDownsampled? fixedHeightDownsampled) => _fixedHeightDownsampled = fixedHeightDownsampled;
  FixedHeight? get fixedHeightSmall => _fixedHeightSmall;
  set fixedHeightSmall(FixedHeight? fixedHeightSmall) => _fixedHeightSmall = fixedHeightSmall;
  Downsized? get fixedHeightSmallStill => _fixedHeightSmallStill;
  set fixedHeightSmallStill(Downsized? fixedHeightSmallStill) => _fixedHeightSmallStill = fixedHeightSmallStill;
  Downsized? get fixedHeightStill => _fixedHeightStill;
  set fixedHeightStill(Downsized? fixedHeightStill) => _fixedHeightStill = fixedHeightStill;
  FixedHeight? get fixedWidth => _fixedWidth;
  set fixedWidth(FixedHeight? fixedWidth) => _fixedWidth = fixedWidth;
  FixedHeightDownsampled? get fixedWidthDownsampled => _fixedWidthDownsampled;
  set fixedWidthDownsampled(FixedHeightDownsampled? fixedWidthDownsampled) => _fixedWidthDownsampled = fixedWidthDownsampled;
  FixedHeight? get fixedWidthSmall => _fixedWidthSmall;
  set fixedWidthSmall(FixedHeight? fixedWidthSmall) => _fixedWidthSmall = fixedWidthSmall;
  Downsized? get fixedWidthSmallStill => _fixedWidthSmallStill;
  set fixedWidthSmallStill(Downsized? fixedWidthSmallStill) => _fixedWidthSmallStill = fixedWidthSmallStill;
  Downsized? get fixedWidthStill => _fixedWidthStill;
  set fixedWidthStill(Downsized? fixedWidthStill) => _fixedWidthStill = fixedWidthStill;
  Looping? get looping => _looping;
  set looping(Looping? looping) => _looping = looping;
  Downsized? get originalStill => _originalStill;
  set originalStill(Downsized? originalStill) => _originalStill = originalStill;
  DownsizedSmall? get originalMp4 => _originalMp4;
  set originalMp4(DownsizedSmall? originalMp4) => _originalMp4 = originalMp4;
  DownsizedSmall? get preview => _preview;
  set preview(DownsizedSmall? preview) => _preview = preview;
  Downsized? get previewGif => _previewGif;
  set previewGif(Downsized? previewGif) => _previewGif = previewGif;
  Downsized? get previewWebp => _previewWebp;
  set previewWebp(Downsized? previewWebp) => _previewWebp = previewWebp;
  Downsized? get d480wStill => _d480wStill;
  set d480wStill(Downsized? d480wStill) => _d480wStill = d480wStill;

  Images.fromJson(Map<String, dynamic> json) {
    _original = json['original'] != null ? new Original.fromJson(json['original']) : null;
    _downsized = json['downsized'] != null ? new Downsized.fromJson(json['downsized']) : null;
    _downsizedLarge = json['downsized_large'] != null ? new Downsized.fromJson(json['downsized_large']) : null;
    _downsizedMedium = json['downsized_medium'] != null ? new Downsized.fromJson(json['downsized_medium']) : null;
    _downsizedSmall = json['downsized_small'] != null ? new DownsizedSmall.fromJson(json['downsized_small']) : null;
    _downsizedStill = json['downsized_still'] != null ? new Downsized.fromJson(json['downsized_still']) : null;
    _fixedHeight = json['fixed_height'] != null ? new FixedHeight.fromJson(json['fixed_height']) : null;
    _fixedHeightDownsampled = json['fixed_height_downsampled'] != null ? new FixedHeightDownsampled.fromJson(json['fixed_height_downsampled']) : null;
    _fixedHeightSmall = json['fixed_height_small'] != null ? new FixedHeight.fromJson(json['fixed_height_small']) : null;
    _fixedHeightSmallStill = json['fixed_height_small_still'] != null ? new Downsized.fromJson(json['fixed_height_small_still']) : null;
    _fixedHeightStill = json['fixed_height_still'] != null ? new Downsized.fromJson(json['fixed_height_still']) : null;
    _fixedWidth = json['fixed_width'] != null ? new FixedHeight.fromJson(json['fixed_width']) : null;
    _fixedWidthDownsampled = json['fixed_width_downsampled'] != null ? new FixedHeightDownsampled.fromJson(json['fixed_width_downsampled']) : null;
    _fixedWidthSmall = json['fixed_width_small'] != null ? new FixedHeight.fromJson(json['fixed_width_small']) : null;
    _fixedWidthSmallStill = json['fixed_width_small_still'] != null ? new Downsized.fromJson(json['fixed_width_small_still']) : null;
    _fixedWidthStill = json['fixed_width_still'] != null ? new Downsized.fromJson(json['fixed_width_still']) : null;
    _looping = json['looping'] != null ? new Looping.fromJson(json['looping']) : null;
    _originalStill = json['original_still'] != null ? new Downsized.fromJson(json['original_still']) : null;
    _originalMp4 = json['original_mp4'] != null ? new DownsizedSmall.fromJson(json['original_mp4']) : null;
    _preview = json['preview'] != null ? new DownsizedSmall.fromJson(json['preview']) : null;
    _previewGif = json['preview_gif'] != null ? new Downsized.fromJson(json['preview_gif']) : null;
    _previewWebp = json['preview_webp'] != null ? new Downsized.fromJson(json['preview_webp']) : null;
    _d480wStill = json['480w_still'] != null ? new Downsized.fromJson(json['480w_still']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._original != null) {
      data['original'] = this._original!.toJson();
    }
    if (this._downsized != null) {
      data['downsized'] = this._downsized!.toJson();
    }
    if (this._downsizedLarge != null) {
      data['downsized_large'] = this._downsizedLarge!.toJson();
    }
    if (this._downsizedMedium != null) {
      data['downsized_medium'] = this._downsizedMedium!.toJson();
    }
    if (this._downsizedSmall != null) {
      data['downsized_small'] = this._downsizedSmall!.toJson();
    }
    if (this._downsizedStill != null) {
      data['downsized_still'] = this._downsizedStill!.toJson();
    }
    if (this._fixedHeight != null) {
      data['fixed_height'] = this._fixedHeight!.toJson();
    }
    if (this._fixedHeightDownsampled != null) {
      data['fixed_height_downsampled'] = this._fixedHeightDownsampled!.toJson();
    }
    if (this._fixedHeightSmall != null) {
      data['fixed_height_small'] = this._fixedHeightSmall!.toJson();
    }
    if (this._fixedHeightSmallStill != null) {
      data['fixed_height_small_still'] = this._fixedHeightSmallStill!.toJson();
    }
    if (this._fixedHeightStill != null) {
      data['fixed_height_still'] = this._fixedHeightStill!.toJson();
    }
    if (this._fixedWidth != null) {
      data['fixed_width'] = this._fixedWidth!.toJson();
    }
    if (this._fixedWidthDownsampled != null) {
      data['fixed_width_downsampled'] = this._fixedWidthDownsampled!.toJson();
    }
    if (this._fixedWidthSmall != null) {
      data['fixed_width_small'] = this._fixedWidthSmall!.toJson();
    }
    if (this._fixedWidthSmallStill != null) {
      data['fixed_width_small_still'] = this._fixedWidthSmallStill!.toJson();
    }
    if (this._fixedWidthStill != null) {
      data['fixed_width_still'] = this._fixedWidthStill!.toJson();
    }
    if (this._looping != null) {
      data['looping'] = this._looping!.toJson();
    }
    if (this._originalStill != null) {
      data['original_still'] = this._originalStill!.toJson();
    }
    if (this._originalMp4 != null) {
      data['original_mp4'] = this._originalMp4!.toJson();
    }
    if (this._preview != null) {
      data['preview'] = this._preview!.toJson();
    }
    if (this._previewGif != null) {
      data['preview_gif'] = this._previewGif!.toJson();
    }
    if (this._previewWebp != null) {
      data['preview_webp'] = this._previewWebp!.toJson();
    }
    if (this._d480wStill != null) {
      data['480w_still'] = this._d480wStill!.toJson();
    }
    return data;
  }
}

class Original {
  String? _height;
  String? _width;
  String? _size;
  String? _url;
  String? _mp4Size;
  String? _mp4;
  String? _webpSize;
  String? _webp;
  String? _frames;
  String? _hash;

  Original({String? height, String? width, String? size, String? url, String? mp4Size, String? mp4, String? webpSize, String? webp, String? frames, String? hash}) {
    if (height != null) {
      this._height = height;
    }
    if (width != null) {
      this._width = width;
    }
    if (size != null) {
      this._size = size;
    }
    if (url != null) {
      this._url = url;
    }
    if (mp4Size != null) {
      this._mp4Size = mp4Size;
    }
    if (mp4 != null) {
      this._mp4 = mp4;
    }
    if (webpSize != null) {
      this._webpSize = webpSize;
    }
    if (webp != null) {
      this._webp = webp;
    }
    if (frames != null) {
      this._frames = frames;
    }
    if (hash != null) {
      this._hash = hash;
    }
  }

  String? get height => _height;
  set height(String? height) => _height = height;
  String? get width => _width;
  set width(String? width) => _width = width;
  String? get size => _size;
  set size(String? size) => _size = size;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get mp4Size => _mp4Size;
  set mp4Size(String? mp4Size) => _mp4Size = mp4Size;
  String? get mp4 => _mp4;
  set mp4(String? mp4) => _mp4 = mp4;
  String? get webpSize => _webpSize;
  set webpSize(String? webpSize) => _webpSize = webpSize;
  String? get webp => _webp;
  set webp(String? webp) => _webp = webp;
  String? get frames => _frames;
  set frames(String? frames) => _frames = frames;
  String? get hash => _hash;
  set hash(String? hash) => _hash = hash;

  Original.fromJson(Map<String, dynamic> json) {
    _height = json['height'];
    _width = json['width'];
    _size = json['size'];
    _url = json['url'];
    _mp4Size = json['mp4_size'];
    _mp4 = json['mp4'];
    _webpSize = json['webp_size'];
    _webp = json['webp'];
    _frames = json['frames'];
    _hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this._height;
    data['width'] = this._width;
    data['size'] = this._size;
    data['url'] = this._url;
    data['mp4_size'] = this._mp4Size;
    data['mp4'] = this._mp4;
    data['webp_size'] = this._webpSize;
    data['webp'] = this._webp;
    data['frames'] = this._frames;
    data['hash'] = this._hash;
    return data;
  }
}

class Downsized {
  String? _height;
  String? _width;
  String? _size;
  String? _url;

  Downsized({String? height, String? width, String? size, String? url}) {
    if (height != null) {
      this._height = height;
    }
    if (width != null) {
      this._width = width;
    }
    if (size != null) {
      this._size = size;
    }
    if (url != null) {
      this._url = url;
    }
  }

  String? get height => _height;
  set height(String? height) => _height = height;
  String? get width => _width;
  set width(String? width) => _width = width;
  String? get size => _size;
  set size(String? size) => _size = size;
  String? get url => _url;
  set url(String? url) => _url = url;

  Downsized.fromJson(Map<String, dynamic> json) {
    _height = json['height'];
    _width = json['width'];
    _size = json['size'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this._height;
    data['width'] = this._width;
    data['size'] = this._size;
    data['url'] = this._url;
    return data;
  }
}

class DownsizedSmall {
  String? _height;
  String? _width;
  String? _mp4Size;
  String? _mp4;

  DownsizedSmall({String? height, String? width, String? mp4Size, String? mp4}) {
    if (height != null) {
      this._height = height;
    }
    if (width != null) {
      this._width = width;
    }
    if (mp4Size != null) {
      this._mp4Size = mp4Size;
    }
    if (mp4 != null) {
      this._mp4 = mp4;
    }
  }

  String? get height => _height;
  set height(String? height) => _height = height;
  String? get width => _width;
  set width(String? width) => _width = width;
  String? get mp4Size => _mp4Size;
  set mp4Size(String? mp4Size) => _mp4Size = mp4Size;
  String? get mp4 => _mp4;
  set mp4(String? mp4) => _mp4 = mp4;

  DownsizedSmall.fromJson(Map<String, dynamic> json) {
    _height = json['height'];
    _width = json['width'];
    _mp4Size = json['mp4_size'];
    _mp4 = json['mp4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this._height;
    data['width'] = this._width;
    data['mp4_size'] = this._mp4Size;
    data['mp4'] = this._mp4;
    return data;
  }
}

class FixedHeight {
  String? _height;
  String? _width;
  String? _size;
  String? _url;
  String? _mp4Size;
  String? _mp4;
  String? _webpSize;
  String? _webp;

  FixedHeight({String? height, String? width, String? size, String? url, String? mp4Size, String? mp4, String? webpSize, String? webp}) {
    if (height != null) {
      this._height = height;
    }
    if (width != null) {
      this._width = width;
    }
    if (size != null) {
      this._size = size;
    }
    if (url != null) {
      this._url = url;
    }
    if (mp4Size != null) {
      this._mp4Size = mp4Size;
    }
    if (mp4 != null) {
      this._mp4 = mp4;
    }
    if (webpSize != null) {
      this._webpSize = webpSize;
    }
    if (webp != null) {
      this._webp = webp;
    }
  }

  String? get height => _height;
  set height(String? height) => _height = height;
  String? get width => _width;
  set width(String? width) => _width = width;
  String? get size => _size;
  set size(String? size) => _size = size;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get mp4Size => _mp4Size;
  set mp4Size(String? mp4Size) => _mp4Size = mp4Size;
  String? get mp4 => _mp4;
  set mp4(String? mp4) => _mp4 = mp4;
  String? get webpSize => _webpSize;
  set webpSize(String? webpSize) => _webpSize = webpSize;
  String? get webp => _webp;
  set webp(String? webp) => _webp = webp;

  FixedHeight.fromJson(Map<String, dynamic> json) {
    _height = json['height'];
    _width = json['width'];
    _size = json['size'];
    _url = json['url'];
    _mp4Size = json['mp4_size'];
    _mp4 = json['mp4'];
    _webpSize = json['webp_size'];
    _webp = json['webp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this._height;
    data['width'] = this._width;
    data['size'] = this._size;
    data['url'] = this._url;
    data['mp4_size'] = this._mp4Size;
    data['mp4'] = this._mp4;
    data['webp_size'] = this._webpSize;
    data['webp'] = this._webp;
    return data;
  }
}

class FixedHeightDownsampled {
  String? _height;
  String? _width;
  String? _size;
  String? _url;
  String? _webpSize;
  String? _webp;

  FixedHeightDownsampled({String? height, String? width, String? size, String? url, String? webpSize, String? webp}) {
    if (height != null) {
      this._height = height;
    }
    if (width != null) {
      this._width = width;
    }
    if (size != null) {
      this._size = size;
    }
    if (url != null) {
      this._url = url;
    }
    if (webpSize != null) {
      this._webpSize = webpSize;
    }
    if (webp != null) {
      this._webp = webp;
    }
  }

  String? get height => _height;
  set height(String? height) => _height = height;
  String? get width => _width;
  set width(String? width) => _width = width;
  String? get size => _size;
  set size(String? size) => _size = size;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get webpSize => _webpSize;
  set webpSize(String? webpSize) => _webpSize = webpSize;
  String? get webp => _webp;
  set webp(String? webp) => _webp = webp;

  FixedHeightDownsampled.fromJson(Map<String, dynamic> json) {
    _height = json['height'];
    _width = json['width'];
    _size = json['size'];
    _url = json['url'];
    _webpSize = json['webp_size'];
    _webp = json['webp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this._height;
    data['width'] = this._width;
    data['size'] = this._size;
    data['url'] = this._url;
    data['webp_size'] = this._webpSize;
    data['webp'] = this._webp;
    return data;
  }
}

class Looping {
  String? _mp4Size;
  String? _mp4;

  Looping({String? mp4Size, String? mp4}) {
    if (mp4Size != null) {
      this._mp4Size = mp4Size;
    }
    if (mp4 != null) {
      this._mp4 = mp4;
    }
  }

  String? get mp4Size => _mp4Size;
  set mp4Size(String? mp4Size) => _mp4Size = mp4Size;
  String? get mp4 => _mp4;
  set mp4(String? mp4) => _mp4 = mp4;

  Looping.fromJson(Map<String, dynamic> json) {
    _mp4Size = json['mp4_size'];
    _mp4 = json['mp4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mp4_size'] = this._mp4Size;
    data['mp4'] = this._mp4;
    return data;
  }
}

class User {
  String? _avatarUrl;
  String? _bannerImage;
  String? _bannerUrl;
  String? _profileUrl;
  String? _username;
  String? _displayName;
  String? _description;
  String? _instagramUrl;
  String? _websiteUrl;
  bool? _isVerified;

  User({String? avatarUrl, String? bannerImage, String? bannerUrl, String? profileUrl, String? username, String? displayName, String? description, String? instagramUrl, String? websiteUrl, bool? isVerified}) {
    if (avatarUrl != null) {
      this._avatarUrl = avatarUrl;
    }
    if (bannerImage != null) {
      this._bannerImage = bannerImage;
    }
    if (bannerUrl != null) {
      this._bannerUrl = bannerUrl;
    }
    if (profileUrl != null) {
      this._profileUrl = profileUrl;
    }
    if (username != null) {
      this._username = username;
    }
    if (displayName != null) {
      this._displayName = displayName;
    }
    if (description != null) {
      this._description = description;
    }
    if (instagramUrl != null) {
      this._instagramUrl = instagramUrl;
    }
    if (websiteUrl != null) {
      this._websiteUrl = websiteUrl;
    }
    if (isVerified != null) {
      this._isVerified = isVerified;
    }
  }

  String? get avatarUrl => _avatarUrl;
  set avatarUrl(String? avatarUrl) => _avatarUrl = avatarUrl;
  String? get bannerImage => _bannerImage;
  set bannerImage(String? bannerImage) => _bannerImage = bannerImage;
  String? get bannerUrl => _bannerUrl;
  set bannerUrl(String? bannerUrl) => _bannerUrl = bannerUrl;
  String? get profileUrl => _profileUrl;
  set profileUrl(String? profileUrl) => _profileUrl = profileUrl;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get displayName => _displayName;
  set displayName(String? displayName) => _displayName = displayName;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get instagramUrl => _instagramUrl;
  set instagramUrl(String? instagramUrl) => _instagramUrl = instagramUrl;
  String? get websiteUrl => _websiteUrl;
  set websiteUrl(String? websiteUrl) => _websiteUrl = websiteUrl;
  bool? get isVerified => _isVerified;
  set isVerified(bool? isVerified) => _isVerified = isVerified;

  User.fromJson(Map<String, dynamic> json) {
    _avatarUrl = json['avatar_url'];
    _bannerImage = json['banner_image'];
    _bannerUrl = json['banner_url'];
    _profileUrl = json['profile_url'];
    _username = json['username'];
    _displayName = json['display_name'];
    _description = json['description'];
    _instagramUrl = json['instagram_url'];
    _websiteUrl = json['website_url'];
    _isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this._avatarUrl;
    data['banner_image'] = this._bannerImage;
    data['banner_url'] = this._bannerUrl;
    data['profile_url'] = this._profileUrl;
    data['username'] = this._username;
    data['display_name'] = this._displayName;
    data['description'] = this._description;
    data['instagram_url'] = this._instagramUrl;
    data['website_url'] = this._websiteUrl;
    data['is_verified'] = this._isVerified;
    return data;
  }
}

class Analytics {
  Onload? _onload;
  Onload? _onclick;
  Onload? _onsent;

  Analytics({Onload? onload, Onload? onclick, Onload? onsent}) {
    if (onload != null) {
      this._onload = onload;
    }
    if (onclick != null) {
      this._onclick = onclick;
    }
    if (onsent != null) {
      this._onsent = onsent;
    }
  }

  Onload? get onload => _onload;
  set onload(Onload? onload) => _onload = onload;
  Onload? get onclick => _onclick;
  set onclick(Onload? onclick) => _onclick = onclick;
  Onload? get onsent => _onsent;
  set onsent(Onload? onsent) => _onsent = onsent;

  Analytics.fromJson(Map<String, dynamic> json) {
    _onload = json['onload'] != null ? new Onload.fromJson(json['onload']) : null;
    _onclick = json['onclick'] != null ? new Onload.fromJson(json['onclick']) : null;
    _onsent = json['onsent'] != null ? new Onload.fromJson(json['onsent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._onload != null) {
      data['onload'] = this._onload!.toJson();
    }
    if (this._onclick != null) {
      data['onclick'] = this._onclick!.toJson();
    }
    if (this._onsent != null) {
      data['onsent'] = this._onsent!.toJson();
    }
    return data;
  }
}

class Onload {
  String? _url;

  Onload({String? url}) {
    if (url != null) {
      this._url = url;
    }
  }

  String? get url => _url;
  set url(String? url) => _url = url;

  Onload.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this._url;
    return data;
  }
}

class Meta {
  int? _status;
  String? _msg;
  String? _responseId;

  Meta({int? status, String? msg, String? responseId}) {
    if (status != null) {
      this._status = status;
    }
    if (msg != null) {
      this._msg = msg;
    }
    if (responseId != null) {
      this._responseId = responseId;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  String? get msg => _msg;
  set msg(String? msg) => _msg = msg;
  String? get responseId => _responseId;
  set responseId(String? responseId) => _responseId = responseId;

  Meta.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _msg = json['msg'];
    _responseId = json['response_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['msg'] = this._msg;
    data['response_id'] = this._responseId;
    return data;
  }
}
