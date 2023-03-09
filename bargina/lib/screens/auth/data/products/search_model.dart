/// id : 45
/// title : "iPhone 11 Pro"

class SearchModel {
  SearchModel({
      int? id, 
      String? title,}){
    _id = id;
    _title = title;
}

  SearchModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }
  int? _id;
  String? _title;

  int? get id => _id;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    return map;
  }

}