class Images {
  Images({
      this.id, 
      this.img, 
      this.description, 
      this.productId, 
      this.token, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.imgPath,});

  Images.fromJson(dynamic json) {
    id = json['id'];
    img = json['img'];
    description = json['description'];
    productId = json['product_id'];
    token = json['_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    imgPath = json['img_path'];
  }
  int? id;
  String? img;
  dynamic description;
  int? productId;
  dynamic token;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? imgPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['img'] = img;
    map['description'] = description;
    map['product_id'] = productId;
    map['_token'] = token;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    map['img_path'] = imgPath;
    return map;
  }

}