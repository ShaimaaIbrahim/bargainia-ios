/// content : "سياسة الارجاع"
/// image : null

class ReturnPolicyModel {
  ReturnPolicyModel({
      String? content, 
      dynamic image,}){
    _content = content;
    _image = image;
}

  ReturnPolicyModel.fromJson(dynamic json) {
    _content = json['content'];
    _image = json['image'];
  }
  String? _content;
  dynamic _image;

  String? get content => _content;
  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = _content;
    map['image'] = _image;
    return map;
  }

}