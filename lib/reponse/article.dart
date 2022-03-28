/// apkLink : ""
/// audit : 1
/// author : "xiaoyang"
/// canEdit : false
/// chapterId : 440
/// chapterName : "官方"
/// collect : false
/// courseId : 13
/// desc : "<p>正在我们在开发的时候，涉及到需要跨进程通信，尤其是较为复杂的，需要拿到服务端 binder 代理进行交互的方式。</p>\r\n<p>一般流程为：</p>\r\n<ol>\r\n<li>编写 aidl 文件；</li>\r\n<li>实现一个 Service 子类(独立进程)，复写 onBind 方法，返回 Binder&#39;s Stub；</li>\r\n<li>主进程通过调用 bindService，间接拿到 binder 驱动，然后实现 binder 通信；</li>\r\n</ol>\r\n<p>更进一步的说，很多时候，我们也可以不依赖 aidl 文件，自己去实现Stub、Proxy类，利用 binder 驱动通过 transact 方法与服务端 Stub onTransact 进行跨进程交互。</p>\r\n<p>但是依然是需要依赖 bindService 方法，去获取 binder驱动。</p>\r\n<p>可以参考：<a href=\"https://blog.csdn.net/lmj623565791/article/details/38461079/\">Android aidl Binder框架浅析</a></p>\r\n<p>不过我们今天的关注点在于：</p>\r\n<ol>\r\n<li>可以不通过 bindService ，利用别的方式来传递 “binder 驱动”来实现跨进程通信吗？</li>\r\n<li>framework 层有哪些地方使用了 1 的方式进行通信？</li>\r\n</ol>"
/// descMd : ""
/// envelopePic : ""
/// fresh : false
/// host : ""
/// id : 21630
/// link : "https://www.wanandroid.com/wenda/show/21630"
/// niceDate : "1天前"
/// niceShareDate : "1天前"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1646152900000
/// realSuperChapterId : 439
/// selfVisible : 0
/// shareDate : 1646152857000
/// shareUser : ""
/// superChapterId : 440
/// superChapterName : "问答"
/// tags : [{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}]
/// title : "每日一问 | 可以不借助 bindService，实现跨进程 binder 通信吗？"
/// type : 1
/// userId : 2
/// visible : 1
/// zan : 1

class Article {
  Article({
    String? apkLink,
    int? audit,
    String? author,
    bool? canEdit,
    int? chapterId,
    String? chapterName,
    bool? collect,
    int? courseId,
    String? desc,
    String? descMd,
    String? envelopePic,
    bool? fresh,
    String? host,
    int? id,
    String? link,
    String? niceDate,
    String? niceShareDate,
    String? origin,
    String? prefix,
    String? projectLink,
    int? publishTime,
    int? realSuperChapterId,
    int? selfVisible,
    int? shareDate,
    String? shareUser,
    int? superChapterId,
    String? superChapterName,
    List<Tags>? tags,
    String? title,
    int? type,
    int? userId,
    int? visible,
    int? zan,
  }) {
    _apkLink = apkLink;
    _audit = audit;
    _author = author;
    _canEdit = canEdit;
    _chapterId = chapterId;
    _chapterName = chapterName;
    _collect = collect;
    _courseId = courseId;
    _desc = desc;
    _descMd = descMd;
    _envelopePic = envelopePic;
    _fresh = fresh;
    _host = host;
    _id = id;
    _link = link;
    _niceDate = niceDate;
    _niceShareDate = niceShareDate;
    _origin = origin;
    _prefix = prefix;
    _projectLink = projectLink;
    _publishTime = publishTime;
    _realSuperChapterId = realSuperChapterId;
    _selfVisible = selfVisible;
    _shareDate = shareDate;
    _shareUser = shareUser;
    _superChapterId = superChapterId;
    _superChapterName = superChapterName;
    _tags = tags;
    _title = title;
    _type = type;
    _userId = userId;
    _visible = visible;
    _zan = zan;
  }

  Article.fromJson(dynamic json) {
    _apkLink = json['apkLink'];
    _audit = json['audit'];
    _author = json['author'];
    _canEdit = json['canEdit'];
    _chapterId = json['chapterId'];
    _chapterName = json['chapterName'];
    _collect = json['collect'];
    _courseId = json['courseId'];
    _desc = json['desc'];
    _descMd = json['descMd'];
    _envelopePic = json['envelopePic'];
    _fresh = json['fresh'];
    _host = json['host'];
    _id = json['id'];
    _link = json['link'];
    _niceDate = json['niceDate'];
    _niceShareDate = json['niceShareDate'];
    _origin = json['origin'];
    _prefix = json['prefix'];
    _projectLink = json['projectLink'];
    _publishTime = json['publishTime'];
    _realSuperChapterId = json['realSuperChapterId'];
    _selfVisible = json['selfVisible'];
    _shareDate = json['shareDate'];
    _shareUser = json['shareUser'];
    _superChapterId = json['superChapterId'];
    _superChapterName = json['superChapterName'];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
    _title = json['title'];
    _type = json['type'];
    _userId = json['userId'];
    _visible = json['visible'];
    _zan = json['zan'];
  }

  String? _apkLink;
  int? _audit;
  String? _author;
  bool? _canEdit;
  int? _chapterId;
  String? _chapterName;
  bool? _collect;
  int? _courseId;
  String? _desc;
  String? _descMd;
  String? _envelopePic;
  bool? _fresh;
  String? _host;
  int? _id;
  String? _link;
  String? _niceDate;
  String? _niceShareDate;
  String? _origin;
  String? _prefix;
  String? _projectLink;
  int? _publishTime;
  int? _realSuperChapterId;
  int? _selfVisible;
  int? _shareDate;
  String? _shareUser;
  int? _superChapterId;
  String? _superChapterName;
  List<Tags>? _tags;
  String? _title;
  int? _type;
  int? _userId;
  int? _visible;
  int? _zan;

  String? get apkLink => _apkLink;

  int? get audit => _audit;

  String get author =>
      (_author != null && _author!.isNotEmpty ? _author : _shareUser) ?? "";

  bool? get canEdit => _canEdit;

  int? get chapterId => _chapterId;

  String get chapterName => _chapterName ?? "";

  bool get collect => _collect ?? false;

  int? get courseId => _courseId;

  String get desc => _desc ?? "";

  String? get descMd => _descMd;

  String get envelopePic => _envelopePic ?? "";

  bool? get fresh => _fresh;

  String? get host => _host;

  int get id => _id ?? 0;

  String get link => _link ?? "";

  String get niceDate => _niceDate ?? "";

  String? get niceShareDate => _niceShareDate;

  String? get origin => _origin;

  String? get prefix => _prefix;

  String? get projectLink => _projectLink;

  int? get publishTime => _publishTime;

  int? get realSuperChapterId => _realSuperChapterId;

  int? get selfVisible => _selfVisible;

  int? get shareDate => _shareDate;

  String? get shareUser => _shareUser;

  int? get superChapterId => _superChapterId;

  String get superChapterName => _superChapterName ?? "";

  List<Tags>? get tags => _tags;

  String get title => _title ?? "";

  int? get type => _type;

  int? get userId => _userId;

  int? get visible => _visible;

  int? get zan => _zan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apkLink'] = _apkLink;
    map['audit'] = _audit;
    map['author'] = _author;
    map['canEdit'] = _canEdit;
    map['chapterId'] = _chapterId;
    map['chapterName'] = _chapterName;
    map['collect'] = _collect;
    map['courseId'] = _courseId;
    map['desc'] = _desc;
    map['descMd'] = _descMd;
    map['envelopePic'] = _envelopePic;
    map['fresh'] = _fresh;
    map['host'] = _host;
    map['id'] = _id;
    map['link'] = _link;
    map['niceDate'] = _niceDate;
    map['niceShareDate'] = _niceShareDate;
    map['origin'] = _origin;
    map['prefix'] = _prefix;
    map['projectLink'] = _projectLink;
    map['publishTime'] = _publishTime;
    map['realSuperChapterId'] = _realSuperChapterId;
    map['selfVisible'] = _selfVisible;
    map['shareDate'] = _shareDate;
    map['shareUser'] = _shareUser;
    map['superChapterId'] = _superChapterId;
    map['superChapterName'] = _superChapterName;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    map['title'] = _title;
    map['type'] = _type;
    map['userId'] = _userId;
    map['visible'] = _visible;
    map['zan'] = _zan;
    return map;
  }
}

/// name : "本站发布"
/// url : "/article/list/0?cid=440"

class Tags {
  Tags({
    String? name,
    String? url,
  }) {
    _name = name;
    _url = url;
  }

  Tags.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }

  String? _name;
  String? _url;

  String? get name => _name;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }
}
