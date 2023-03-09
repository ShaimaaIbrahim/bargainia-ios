/// content : "نبذة عناBargainiaماذا تعرف عن  بارجينيا هو سوق من مستخدم إلى مستخدم لأجهزة التكنولوجيا  المستعملة بعناية من قبلهم. كما ان توفر الأمان والبساطة و العامل البشري كمستخدم لهذه التكنولوجيا تجعل بارجينيا أفضل."
/// image : null

class AboutUsModel {
  AboutUsModel({
      String? content, 
      dynamic image,}){
    _content = content;
    _image = image;
}

  AboutUsModel.fromJson(dynamic json) {
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