/// children : []
/// courseId : 13
/// id : 294
/// name : "完整项目"
/// order : 145000
/// parentChapterId : 293
/// userControlSetTop : false
/// visible : 0

class Category {
  Category({
    List<Category>? children,
    int? courseId,
    int? id,
    String? name,
    int? order,
    int? parentChapterId,
    bool? userControlSetTop,
    int? visible,
  }) {
    _children = children;
    _courseId = courseId;
    _id = id;
    _name = name;
    _order = order;
    _parentChapterId = parentChapterId;
    _userControlSetTop = userControlSetTop;
    _visible = visible;
  }

  Category.fromJson(dynamic json) {
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(Category.fromJson(v));
      });
    }
    _courseId = json['courseId'];
    _id = json['id'];
    _name = json['name'];
    _order = json['order'];
    _parentChapterId = json['parentChapterId'];
    _userControlSetTop = json['userControlSetTop'];
    _visible = json['visible'];
  }

  List<Category>? _children;
  int? _courseId;
  int? _id;
  String? _name;
  int? _order;
  int? _parentChapterId;
  bool? _userControlSetTop;
  int? _visible;

  List<Category> get children => _children ?? [];

  int? get courseId => _courseId;

  int? get id => _id;

  String get name => _name ?? "";

  int? get order => _order;

  int? get parentChapterId => _parentChapterId;

  bool? get userControlSetTop => _userControlSetTop;

  int? get visible => _visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    map['courseId'] = _courseId;
    map['id'] = _id;
    map['name'] = _name;
    map['order'] = _order;
    map['parentChapterId'] = _parentChapterId;
    map['userControlSetTop'] = _userControlSetTop;
    map['visible'] = _visible;
    return map;
  }
}
