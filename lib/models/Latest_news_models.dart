
class LatestNewsModels {
  LatestNewsModels({
      bool? success, 
      String? message, 
      Datas? datas,}){
    _success = success;
    _message = message;
    _datas = datas;
}

  LatestNewsModels.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _datas = json['data'] != null ? Datas.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Datas? _datas;
LatestNewsModels copyWith({  bool? success,
  String? message,
  Datas? datas,
}) => LatestNewsModels(  success: success ?? _success,
  message: message ?? _message,
  datas: datas ?? _datas,
);
  bool? get success => _success;
  String? get message => _message;
  Datas? get datas => _datas;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_datas != null) {
      map['data'] = _datas?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
    int? id,
    String? title,
    List<String>? image,
    String? date,
    String? createdAt,
    String? newsSubcategory,
    String? newsCategory,
    String? newsCategoryslug,
    String? reporterName,}){
    _id = id;
    _title = title;
    _image = image;
    _date = date;
    _createdAt = createdAt;
    _newsSubcategory = newsSubcategory;
    _newsCategory = newsCategory;
    _newsCategoryslug = newsCategoryslug;
    _reporterName = reporterName;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'] != null ? json['image'].cast<String>() : [];
    _date = json['date'];
    _createdAt = json['created_at'];
    _newsSubcategory = json['news_subcategory'];
    _newsCategory = json['news_category'];
    _newsCategoryslug = json['news_categoryslug'];
    _reporterName = json['reporter_name'];
  }
  int? _id;
  String? _title;
  List<String>? _image;
  String? _date;
  String? _createdAt;
  String? _newsSubcategory;
  String? _newsCategory;
  String? _newsCategoryslug;
  String? _reporterName;
  Data copyWith({  int? id,
    String? title,
    List<String>? image,
    String? date,
    String? createdAt,
    String? newsSubcategory,
    String? newsCategory,
    String? newsCategoryslug,
    String? reporterName,
  }) => Data(  id: id ?? _id,
    title: title ?? _title,
    image: image ?? _image,
    date: date ?? _date,
    createdAt: createdAt ?? _createdAt,
    newsSubcategory: newsSubcategory ?? _newsSubcategory,
    newsCategory: newsCategory ?? _newsCategory,
    newsCategoryslug: newsCategoryslug ?? _newsCategoryslug,
    reporterName: reporterName ?? _reporterName,
  );
  int? get id => _id;
  String? get title => _title;
  List<String>? get image => _image;
  String? get date => _date;
  String? get createdAt => _createdAt;
  String? get newsSubcategory => _newsSubcategory;
  String? get newsCategory => _newsCategory;
  String? get newsCategoryslug => _newsCategoryslug;
  String? get reporterName => _reporterName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image'] = _image;
    map['date'] = _date;
    map['created_at'] = _createdAt;
    map['news_subcategory'] = _newsSubcategory;
    map['news_category'] = _newsCategory;
    map['news_categoryslug'] = _newsCategoryslug;
    map['reporter_name'] = _reporterName;
    return map;
  }

}

class Datas {
  Datas({
    int? currentPage,
    List<Data>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    String? nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,}){
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
  }

  Datas.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  int? _currentPage;
  List<Data>? _data;
  String? _firstPageUrl;
  int? _from;
  int? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  String? _nextPageUrl;
  String? _path;
  int? _perPage;
  dynamic _prevPageUrl;
  int? _to;
  int? _total;
  Datas copyWith({  int? currentPage,
    List<Data>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    String? nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) => Datas(  currentPage: currentPage ?? _currentPage,
    data: data ?? _data,
    firstPageUrl: firstPageUrl ?? _firstPageUrl,
    from: from ?? _from,
    lastPage: lastPage ?? _lastPage,
    lastPageUrl: lastPageUrl ?? _lastPageUrl,
    links: links ?? _links,
    nextPageUrl: nextPageUrl ?? _nextPageUrl,
    path: path ?? _path,
    perPage: perPage ?? _perPage,
    prevPageUrl: prevPageUrl ?? _prevPageUrl,
    to: to ?? _to,
    total: total ?? _total,
  );
  int? get currentPage => _currentPage;
  List<Data>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  int? get from => _from;
  int? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  List<Links>? get links => _links;
  String? get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  int? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  int? get to => _to;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

class Links {
  Links({
    dynamic url,
    String? label,
    bool? active,}){
    _url = url;
    _label = label;
    _active = active;
  }

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  dynamic _url;
  String? _label;
  bool? _active;
  Links copyWith({  dynamic url,
    String? label,
    bool? active,
  }) => Links(  url: url ?? _url,
    label: label ?? _label,
    active: active ?? _active,
  );
  dynamic get url => _url;
  String? get label => _label;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }

}