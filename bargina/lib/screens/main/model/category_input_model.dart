import 'dart:convert';
/// id : 4
/// dname : "الالوان"
/// classfield : "colors"
/// required : 1
/// type : "Text"
/// help : null
/// options : [{"id":4,"field_id":4,"value_ar":"اسود","value_en":"black","_token":null,"created_at":"2020-09-30 15:25:06","updated_at":"2020-09-30 15:25:06","deleted_at":null},{"id":25,"field_id":4,"value_ar":"الاخضر الغامق","value_en":"Midnight Green","_token":"jCJ2RslDXsEDHgue1pPuvcEMT322QnCz1QP2e98L","created_at":"2021-04-17 12:00:40","updated_at":"2021-04-17 12:00:40","deleted_at":null},{"id":31,"field_id":4,"value_ar":"فضي","value_en":"Silver","_token":null,"created_at":"2021-03-02 23:20:22","updated_at":"2021-03-02 23:20:22","deleted_at":null},{"id":32,"field_id":4,"value_ar":"ذهبي","value_en":"Gold","_token":null,"created_at":"2021-03-02 23:38:11","updated_at":"2021-03-02 23:38:11","deleted_at":null},{"id":34,"field_id":4,"value_ar":"بنفسجي","value_en":"purple","_token":null,"created_at":"2021-04-17 15:08:10","updated_at":"2021-04-17 15:08:10","deleted_at":null},{"id":35,"field_id":4,"value_ar":"أصفر","value_en":"yellow","_token":null,"created_at":"2021-04-17 15:08:45","updated_at":"2021-04-17 15:08:45","deleted_at":null},{"id":36,"field_id":4,"value_ar":"ابيض","value_en":"white","_token":null,"created_at":"2021-04-17 15:08:57","updated_at":"2021-04-17 15:08:57","deleted_at":null},{"id":37,"field_id":4,"value_ar":"الأزرق السلمي","value_en":"pacific Blue","_token":null,"created_at":"2021-04-17 15:16:28","updated_at":"2021-04-17 15:16:28","deleted_at":null},{"id":38,"field_id":4,"value_ar":"اسود","value_en":"Phantom Black","_token":null,"created_at":"2021-04-18 10:51:10","updated_at":"2021-04-18 10:51:10","deleted_at":null},{"id":39,"field_id":4,"value_ar":"رمادي","value_en":"Phantom Gray","_token":null,"created_at":"2021-04-18 10:51:40","updated_at":"2021-04-18 10:51:40","deleted_at":null},{"id":40,"field_id":4,"value_ar":"الرمادي الكوني","value_en":"Cosmic Gray","_token":null,"created_at":"2021-04-18 10:52:38","updated_at":"2021-04-18 10:52:38","deleted_at":null},{"id":49,"field_id":4,"value_ar":"أزرق","value_en":"blue","_token":null,"created_at":"2021-07-26 08:41:53","updated_at":"2021-07-26 08:41:53","deleted_at":null},{"id":51,"field_id":4,"value_ar":"اخضر","value_en":"Green","_token":null,"created_at":"2021-08-11 08:15:04","updated_at":"2021-08-11 08:15:04","deleted_at":null},{"id":52,"field_id":4,"value_ar":"dream Glow","value_en":"dream Glow","_token":null,"created_at":"2021-08-28 03:52:03","updated_at":"2021-08-28 03:52:03","deleted_at":null},{"id":53,"field_id":4,"value_ar":"الاحمر","value_en":"Red","_token":null,"created_at":"2021-09-26 02:34:33","updated_at":"2021-09-26 02:34:33","deleted_at":null},{"id":54,"field_id":4,"value_ar":"Titanium Sapphire","value_en":"Titanium Sapphire","_token":null,"created_at":"2021-09-26 03:15:37","updated_at":"2021-09-26 03:15:37","deleted_at":null},{"id":55,"field_id":4,"value_ar":"OCEAN WAVE","value_en":"OCEAN WAVE","_token":null,"created_at":"2021-09-27 00:44:07","updated_at":"2021-09-27 00:44:07","deleted_at":null},{"id":56,"field_id":4,"value_ar":"Morandi Green","value_en":"Morandi Green","_token":null,"created_at":"2021-09-27 01:00:34","updated_at":"2021-09-27 01:00:34","deleted_at":null},{"id":57,"field_id":4,"value_ar":"رمادي","value_en":"Graphite Grey","_token":null,"created_at":"2021-09-28 04:19:41","updated_at":"2021-09-28 04:19:41","deleted_at":null},{"id":58,"field_id":4,"value_ar":"Power black","value_en":"Power black","_token":null,"created_at":"2021-09-28 04:39:30","updated_at":"2021-09-28 04:39:30","deleted_at":null},{"id":59,"field_id":4,"value_ar":"رمادي","value_en":"Grey","_token":null,"created_at":"2021-10-10 18:23:41","updated_at":"2021-10-10 18:23:41","deleted_at":null}]

CategoryInputModel categoryInputModelFromJson(String str) => CategoryInputModel.fromJson(json.decode(str));
String categoryInputModelToJson(CategoryInputModel data) => json.encode(data.toJson());
class CategoryInputModel {
  CategoryInputModel({
      int? id, 
      String? dname, 
      String? classfield, 
      int? required, 
      String? type, 
      dynamic help, 
      List<Option>? options,}){
    _id = id;
    _dname = dname;
    _classfield = classfield;
    _required = required;
    _type = type;
    _help = help;
    _options = options;
}

  CategoryInputModel.fromJson(dynamic json) {
    _id = json['id'];
    _dname = json['dname'];
    _classfield = json['classfield'];
    _required = json['required'];
    _type = json['type'];
    _help = json['help'];
    if (json['options'] != null) {
      _options = [];
      json['options'].forEach((v) {
        _options?.add(Option.fromJson(v));
      });
    }
  }
  int? _id;
  String? _dname;
  String? _classfield;
  int? _required;
  String? _type;
  dynamic _help;
  List<Option>? _options;

  int? get id => _id;
  String? get dname => _dname;
  String? get classfield => _classfield;
  int? get required => _required;
  String? get type => _type;
  dynamic get help => _help;
  List<Option>? get options => _options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['dname'] = _dname;
    map['classfield'] = _classfield;
    map['required'] = _required;
    map['type'] = _type;
    map['help'] = _help;
    if (_options != null) {
      map['options'] = _options?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4
/// field_id : 4
/// value_ar : "اسود"
/// value_en : "black"
/// _token : null
/// created_at : "2020-09-30 15:25:06"
/// updated_at : "2020-09-30 15:25:06"
/// deleted_at : null

Option optionsFromJson(String str) => Option.fromJson(json.decode(str));
String optionsToJson(Option data) => json.encode(data.toJson());
class Option {
  Option({
      int? id, 
      int? fieldId, 
      String? valueAr, 
      String? valueEn, 
      dynamic token, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt,}){
    _id = id;
    _fieldId = fieldId;
    _valueAr = valueAr;
    _valueEn = valueEn;
    _token = token;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  Option.fromJson(dynamic json) {
    _id = json['id'];
    _fieldId = json['field_id'];
    _valueAr = json['value_ar'];
    _valueEn = json['value_en'];
    _token = json['_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  int? _id;
  int? _fieldId;
  String? _valueAr;
  String? _valueEn;
  dynamic _token;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;

  int? get id => _id;
  int? get fieldId => _fieldId;
  String? get valueAr => _valueAr;
  String? get valueEn => _valueEn;
  dynamic get token => _token;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['field_id'] = _fieldId;
    map['value_ar'] = _valueAr;
    map['value_en'] = _valueEn;
    map['_token'] = _token;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}