/// id : 182
/// lookup_id : 61
/// name : "سامسونج"
/// parent_id : 181
/// slug : "samsung"
/// avg : 0

class SellSubCategoryModel {
  SellSubCategoryModel({
      dynamic id,
      dynamic lookupId,
      dynamic name,
      dynamic parentId,
      dynamic slug,
      dynamic avg,}){
    _id = id;
    _lookupId = lookupId;
    _name = name;
    _parentId = parentId;
    _slug = slug;
    _avg = avg;
}

  SellSubCategoryModel.fromJson(dynamic json) {
    _id = json['id'];
    _lookupId = json['lookup_id'];
    _name = json['name'];
    _parentId = json['parent_id'];
    _slug = json['slug'];
    _avg = json['avg'];
  }
  dynamic _id;
  dynamic _lookupId;
  dynamic _name;
  dynamic _parentId;
  dynamic _slug;
  dynamic _avg;

  dynamic get id => _id;
  dynamic get lookupId => _lookupId;
  dynamic get name => _name;
  dynamic get parentId => _parentId;
  dynamic get slug => _slug;
  dynamic get avg => _avg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['lookup_id'] = _lookupId;
    map['name'] = _name;
    map['parent_id'] = _parentId;
    map['slug'] = _slug;
    map['avg'] = _avg;
    return map;
  }

}