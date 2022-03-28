/// desc : "一起来做个App吧"
/// id : 10
/// imagePath : "https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png"
/// isVisible : 1
/// order : 1
/// title : "一起来做个App吧"
/// type : 0
/// url : "https://www.wanandroid.com/blog/show/2"

class BannerModel {
  BannerModel({
    String? desc,
    int? id,
    String? imagePath,
    int? isVisible,
    int? order,
    String? title,
    int? type,
    String? url,
  }) {
    _desc = desc;
    _id = id;
    _imagePath = imagePath;
    _isVisible = isVisible;
    _order = order;
    _title = title;
    _type = type;
    _url = url;
  }

  BannerModel.fromJson(dynamic json) {
    _desc = json['desc'];
    _id = json['id'];
    _imagePath = json['imagePath'];
    _isVisible = json['isVisible'];
    _order = json['order'];
    _title = json['title'];
    _type = json['type'];
    _url = json['url'];
  }

  String? _desc;
  int? _id;
  String? _imagePath;
  int? _isVisible;
  int? _order;
  String? _title;
  int? _type;
  String? _url;

  String? get desc => _desc;

  int get id => _id ?? 0;

  String get imagePath => _imagePath ?? "";

  int? get isVisible => _isVisible;

  int? get order => _order;

  String get title => _title ?? "";

  int? get type => _type;

  String get url => _url ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['desc'] = _desc;
    map['id'] = _id;
    map['imagePath'] = _imagePath;
    map['isVisible'] = _isVisible;
    map['order'] = _order;
    map['title'] = _title;
    map['type'] = _type;
    map['url'] = _url;
    return map;
  }
}
