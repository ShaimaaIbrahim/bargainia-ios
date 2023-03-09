import 'dart:convert';
/// productId : "1457"
/// categoryId : "96"
/// productName : "Apple & iTunes  2$ - USA"
/// productPrice : 7.33
/// productPriceWithoutVat : "7.33"
/// productImage : "https://likecard-space.fra1.digitaloceanspaces.com/products/08cfa-itunes-usa.png"
/// productCurrency : "SAR"
/// optionalFieldsExist : 0
/// productOptionalFields : ""
/// sellPrice : "7.5"
/// sellPriceWithoutVat : "7.5"
/// available : true
/// vatAmount : 0
/// vatPercentage : 0
/// total_price : 7.875

Like4cardCatProduct like4cardCatProductFromJson(String str) => Like4cardCatProduct.fromJson(json.decode(str));
String like4cardCatProductToJson(Like4cardCatProduct data) => json.encode(data.toJson());
class Like4cardCatProduct {
  Like4cardCatProduct({
      String? productId, 
      String? categoryId, 
      String? productName, 
      dynamic productPrice,
      String? productPriceWithoutVat, 
      String? productImage, 
      String? productCurrency, 
      dynamic optionalFieldsExist,
      String? productOptionalFields, 
      String? sellPrice, 
      String? sellPriceWithoutVat, 
      bool? available, 
      dynamic vatAmount,
      dynamic vatPercentage,
      dynamic totalPrice,}){
    _productId = productId;
    _categoryId = categoryId;
    _productName = productName;
    _productPrice = productPrice;
    _productPriceWithoutVat = productPriceWithoutVat;
    _productImage = productImage;
    _productCurrency = productCurrency;
    _optionalFieldsExist = optionalFieldsExist;
    _productOptionalFields = productOptionalFields;
    _sellPrice = sellPrice;
    _sellPriceWithoutVat = sellPriceWithoutVat;
    _available = available;
    _vatAmount = vatAmount;
    _vatPercentage = vatPercentage;
    _totalPrice = totalPrice;
}

  Like4cardCatProduct.fromJson(dynamic json) {
    _productId = json['productId'];
    _categoryId = json['categoryId'];
    _productName = json['productName'];
    _productPrice = json['productPrice'];
    _productPriceWithoutVat = json['productPriceWithoutVat'];
    _productImage = json['productImage'];
    _productCurrency = json['productCurrency'];
    _optionalFieldsExist = json['optionalFieldsExist'];
    _productOptionalFields = json['productOptionalFields'];
    _sellPrice = json['sellPrice'];
    _sellPriceWithoutVat = json['sellPriceWithoutVat'];
    _available = json['available'];
    _vatAmount = json['vatAmount'];
    _vatPercentage = json['vatPercentage'];
    _totalPrice = json['total_price'];
  }
  String? _productId;
  String? _categoryId;
  String? _productName;
  dynamic _productPrice;
  String? _productPriceWithoutVat;
  String? _productImage;
  String? _productCurrency;
  dynamic _optionalFieldsExist;
  String? _productOptionalFields;
  String? _sellPrice;
  String? _sellPriceWithoutVat;
  bool? _available;
  dynamic _vatAmount;
  dynamic _vatPercentage;
  dynamic _totalPrice;

  String? get productId => _productId;
  String? get categoryId => _categoryId;
  String? get productName => _productName;
  dynamic get productPrice => _productPrice;
  String? get productPriceWithoutVat => _productPriceWithoutVat;
  String? get productImage => _productImage;
  String? get productCurrency => _productCurrency;
  dynamic get optionalFieldsExist => _optionalFieldsExist;
  String? get productOptionalFields => _productOptionalFields;
  String? get sellPrice => _sellPrice;
  String? get sellPriceWithoutVat => _sellPriceWithoutVat;
  bool? get available => _available;
  dynamic get vatAmount => _vatAmount;
  dynamic get vatPercentage => _vatPercentage;
  dynamic get totalPrice => _totalPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['categoryId'] = _categoryId;
    map['productName'] = _productName;
    map['productPrice'] = _productPrice;
    map['productPriceWithoutVat'] = _productPriceWithoutVat;
    map['productImage'] = _productImage;
    map['productCurrency'] = _productCurrency;
    map['optionalFieldsExist'] = _optionalFieldsExist;
    map['productOptionalFields'] = _productOptionalFields;
    map['sellPrice'] = _sellPrice;
    map['sellPriceWithoutVat'] = _sellPriceWithoutVat;
    map['available'] = _available;
    map['vatAmount'] = _vatAmount;
    map['vatPercentage'] = _vatPercentage;
    map['total_price'] = _totalPrice;
    return map;
  }

}