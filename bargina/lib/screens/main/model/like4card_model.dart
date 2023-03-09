import 'dart:convert';
/// id : "59"
/// categoryParentId : "0"
/// categoryName : "Apple & iTunes"
/// amazonImage : "https://likecard-space.fra1.digitaloceanspaces.com/categories/50532-itunes.png"
/// childs : [{"id":"96","categoryParentId":"59","categoryName":"Apple & iTunes - USA","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/903d9-.png","childs":[]},{"id":"121","categoryParentId":"59","categoryName":"Apple & iTunes  - KSA","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/53845-.png","childs":[]},{"id":"126","categoryParentId":"59","categoryName":"Apple & iTunes - UAE","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/85e74-.png","childs":[]},{"id":"151","categoryParentId":"59","categoryName":"Apple & iTunes - British","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/76250-.png","childs":[]},{"id":"140","categoryParentId":"59","categoryName":"Apple & iTunes - Canadian","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/19633-.png","childs":[]},{"id":"252","categoryParentId":"59","categoryName":"Apple & iTunes - French","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/76720-eur.png","childs":[]},{"id":"259","categoryParentId":"59","categoryName":"Apple & iTunes - Spanish","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/e0824-qqw.gif","childs":[]},{"id":"296","categoryParentId":"59","categoryName":"Apple & iTunes - Japanese","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/5fc44-.png","childs":[]},{"id":"255","categoryParentId":"59","categoryName":"Apple & iTunes - Italian","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/d3c30-eur.png","childs":[]},{"id":"253","categoryParentId":"59","categoryName":"Apple & iTunes - German","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/d88d4-eur.png","childs":[]},{"id":"258","categoryParentId":"59","categoryName":"Apple & iTunes - Portuguese","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/c1b32-eur.png","childs":[]},{"id":"250","categoryParentId":"59","categoryName":"Apple & iTunes - Belguim","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/adced-eur.png","childs":[]},{"id":"254","categoryParentId":"59","categoryName":"Apple & iTunes - Irish","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/29ef2-eur.png","childs":[]},{"id":"256","categoryParentId":"59","categoryName":"Apple & iTunes - Dutch","amazonImage":"https://likecard-space.fra1.digitaloceanspaces.com/categories/70f85-eur.png","childs":[]}]

Like4cardModel like4cardModelFromJson(String str) => Like4cardModel.fromJson(json.decode(str));
String like4cardModelToJson(Like4cardModel data) => json.encode(data.toJson());
class Like4cardModel {
  Like4cardModel({
      String? id, 
      String? categoryParentId, 
      String? categoryName, 
      String? amazonImage, 
      List<Childs>? childs,}){
    _id = id;
    _categoryParentId = categoryParentId;
    _categoryName = categoryName;
    _amazonImage = amazonImage;
    _childs = childs;
}

  Like4cardModel.fromJson(dynamic json) {
    _id = json['id'];
    _categoryParentId = json['categoryParentId'];
    _categoryName = json['categoryName'];
    _amazonImage = json['amazonImage'];
    if (json['childs'] != null) {
      _childs = [];
      json['childs'].forEach((v) {
        _childs?.add(Childs.fromJson(v));
      });
    }
  }
  String? _id;
  String? _categoryParentId;
  String? _categoryName;
  String? _amazonImage;
  List<Childs>? _childs;

  String? get id => _id;
  String? get categoryParentId => _categoryParentId;
  String? get categoryName => _categoryName;
  String? get amazonImage => _amazonImage;
  List<Childs>? get childs => _childs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['categoryParentId'] = _categoryParentId;
    map['categoryName'] = _categoryName;
    map['amazonImage'] = _amazonImage;
    if (_childs != null) {
      map['childs'] = _childs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "96"
/// categoryParentId : "59"
/// categoryName : "Apple & iTunes - USA"
/// amazonImage : "https://likecard-space.fra1.digitaloceanspaces.com/categories/903d9-.png"
/// childs : []

Childs childsFromJson(String str) => Childs.fromJson(json.decode(str));
String childsToJson(Childs data) => json.encode(data.toJson());
class Childs {
  Childs({
      String? id, 
      String? categoryParentId, 
      String? categoryName, 
      String? amazonImage, 
      List<dynamic>? childs,}){
    _id = id;
    _categoryParentId = categoryParentId;
    _categoryName = categoryName;
    _amazonImage = amazonImage;
    _childs = childs;
}

  Childs.fromJson(dynamic json) {
    _id = json['id'];
    _categoryParentId = json['categoryParentId'];
    _categoryName = json['categoryName'];
    _amazonImage = json['amazonImage'];
    if (json['childs'] != null) {
      _childs = [];
      json['childs'].forEach((v) {
        _childs?.add({});
      });
    }
  }
  String? _id;
  String? _categoryParentId;
  String? _categoryName;
  String? _amazonImage;
  List<dynamic>? _childs;

  String? get id => _id;
  String? get categoryParentId => _categoryParentId;
  String? get categoryName => _categoryName;
  String? get amazonImage => _amazonImage;
  List<dynamic>? get childs => _childs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['categoryParentId'] = _categoryParentId;
    map['categoryName'] = _categoryName;
    map['amazonImage'] = _amazonImage;
    if (_childs != null) {
      map['childs'] = _childs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}