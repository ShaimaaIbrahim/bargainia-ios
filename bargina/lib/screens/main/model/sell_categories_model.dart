/// id : 181
/// title : "هواتف"
/// image : "https://bargainia.com.sa/storage/uploads/tmpphphlzcnw.png"
/// products_count : 303
/// sub_categories : [{"id":214,"lookup_id":61,"name":"أيفون","parent_id":181,"image":"tmpphp3j40bs.png","slug":"iPhones"},{"id":215,"lookup_id":61,"name":"سامسونج","parent_id":181,"image":"tmpphpamofah.png","slug":"Samsung"},{"id":223,"lookup_id":61,"name":"تشاومي","parent_id":181,"image":"tmpphpmjsuvv.png","slug":"Xiaomi"},{"id":227,"lookup_id":61,"name":"أوبو","parent_id":181,"image":"tmpphpukp58f.png","slug":"Oppo"},{"id":555,"lookup_id":61,"name":"vivo","parent_id":181,"image":"tmpphpxihpb6.jpg","slug":"vivo"},{"id":567,"lookup_id":61,"name":"Android Modules","parent_id":181,"image":null,"slug":"Android Modules"},{"id":645,"lookup_id":61,"name":"هواوي","parent_id":181,"image":null,"slug":"هواوي"}]

class SellCategoriesModel {
  SellCategoriesModel({
      int? id, 
      String? title, 
      String? image, 
      int? productsCount, 
      List<SubCategories>? subCategories,}){
    _id = id;
    _title = title;
    _image = image;
    _productsCount = productsCount;
    _subCategories = subCategories;
}

  SellCategoriesModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
    _productsCount = json['products_count'];
    if (json['sub_categories'] != null) {
      _subCategories = [];
      json['sub_categories'].forEach((v) {
        _subCategories?.add(SubCategories.fromJson(v));
      });
    }
  }
  int? _id;
  String? _title;
  String? _image;
  int? _productsCount;
  List<SubCategories>? _subCategories;

  int? get id => _id;
  String? get title => _title;
  String? get image => _image;
  int? get productsCount => _productsCount;
  List<SubCategories>? get subCategories => _subCategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image'] = _image;
    map['products_count'] = _productsCount;
    if (_subCategories != null) {
      map['sub_categories'] = _subCategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 214
/// lookup_id : 61
/// name : "أيفون"
/// parent_id : 181
/// image : "tmpphp3j40bs.png"
/// slug : "iPhones"

class SubCategories {
  SubCategories({
      int? id, 
      int? lookupId, 
      String? name, 
      int? parentId, 
      String? image, 
      String? slug,}){
    _id = id;
    _lookupId = lookupId;
    _name = name;
    _parentId = parentId;
    _image = image;
    _slug = slug;
}

  SubCategories.fromJson(dynamic json) {
    _id = json['id'];
    _lookupId = json['lookup_id'];
    _name = json['name'];
    _parentId = json['parent_id'];
    _image = json['image'];
    _slug = json['slug'];
  }
  int? _id;
  int? _lookupId;
  String? _name;
  int? _parentId;
  String? _image;
  String? _slug;

  int? get id => _id;
  int? get lookupId => _lookupId;
  String? get name => _name;
  int? get parentId => _parentId;
  String? get image => _image;
  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['lookup_id'] = _lookupId;
    map['name'] = _name;
    map['parent_id'] = _parentId;
    map['image'] = _image;
    map['slug'] = _slug;
    return map;
  }

}