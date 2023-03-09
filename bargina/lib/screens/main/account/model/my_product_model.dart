import 'dart:convert';
/// code : "GPO2BOXG"
/// start_date_discount : "2021-06-06"
/// last_date_discount : "2021-06-30"
/// price_discount : 2950
/// total_discount : 3097.5
/// name : "ايفون 11 برو ماكس"
/// slug : "iphone 11 pro max"
/// model_slug : "iphone 11 pro max"
/// id : 374
/// model_id : 300
/// catname : null
/// older : 0
/// cat_id : 181
/// main_img : "https://bargainia.com.sa/storage/uploads/tmpphpvbcsbd.jpeg"
/// price : "2900"
/// total : 3045
/// price_after_discount : null
/// st : 1
/// type : 2
/// way_name : "بارجينيا"
/// order_type : "تم الشحن"
/// aramex_link : null
/// status : 0
/// label : "In Stock"
/// quantatity : null
/// remain_amount : null
/// extra_cost : null
/// barginia_fee : null
/// damage_description : null
/// description : null
/// weight : null
/// width : null
/// height : null
/// product_inputs : [{"id":895,"product_id":374,"input_id":2,"value":"26","type":"Selectbox","created_at":"2021-07-04 21:57:26","updated_at":"2021-07-04 21:57:26","deleted_at":null,"name":"وحدة الذاكرة"},{"id":896,"product_id":374,"input_id":4,"value":"25","type":"Selectbox","created_at":"2021-07-04 21:57:26","updated_at":"2021-07-04 21:57:26","deleted_at":null,"name":"الالوان"},{"id":897,"product_id":374,"input_id":5,"value":"100%","type":"Text","created_at":"2021-07-04 21:57:26","updated_at":"2021-07-04 21:57:26","deleted_at":null,"name":"حالة البطاريه"},{"id":898,"product_id":374,"input_id":6,"value":"21","type":"Selectbox","created_at":"2021-07-04 21:57:26","updated_at":"2021-07-04 21:57:26","deleted_at":null,"name":"كاميرا"},{"id":899,"product_id":374,"input_id":7,"value":"11","type":"Selectbox","created_at":"2021-07-04 21:57:26","updated_at":"2021-07-04 21:57:26","deleted_at":null,"name":"المساحة"},{"id":900,"product_id":374,"input_id":11,"value":null,"type":"Text","created_at":"2021-07-04 21:57:26","updated_at":"2021-07-04 21:57:26","deleted_at":null,"name":"المتبقي من فترة الضمان"},{"id":901,"product_id":374,"input_id":12,"value":null,"type":"Text","created_at":"2021-07-04 21:57:26","updated_at":"2021-07-04 21:57:26","deleted_at":null,"name":"الوكيل"}]

MyProductModel myProductModelFromJson(String str) => MyProductModel.fromJson(json.decode(str));
String myProductModelToJson(MyProductModel data) => json.encode(data.toJson());
class MyProductModel {
  MyProductModel({
      String? code, 
      String? startDateDiscount, 
      String? lastDateDiscount, 
      dynamic priceDiscount,
      dynamic totalDiscount,
      String? name, 
      String? slug, 
      String? modelSlug, 
      dynamic id,
      dynamic modelId,
      dynamic catname, 
      dynamic older,
      dynamic catId,
      String? mainImg, 
      String? price, 
      dynamic total,
      dynamic priceAfterDiscount, 
      dynamic st,
      dynamic type,
      String? wayName, 
      String? orderType, 
      dynamic aramexLink, 
      dynamic status,
      String? label, 
      dynamic quantatity, 
      dynamic remainAmount, 
      dynamic extraCost, 
      dynamic barginiaFee, 
      dynamic damageDescription, 
      dynamic description, 
      dynamic weight, 
      dynamic width, 
      dynamic height, 
      List<ProductInputs>? productInputs,}){
    _code = code;
    _startDateDiscount = startDateDiscount;
    _lastDateDiscount = lastDateDiscount;
    _priceDiscount = priceDiscount;
    _totalDiscount = totalDiscount;
    _name = name;
    _slug = slug;
    _modelSlug = modelSlug;
    _id = id;
    _modelId = modelId;
    _catname = catname;
    _older = older;
    _catId = catId;
    _mainImg = mainImg;
    _price = price;
    _total = total;
    _priceAfterDiscount = priceAfterDiscount;
    _st = st;
    _type = type;
    _wayName = wayName;
    _orderType = orderType;
    _aramexLink = aramexLink;
    _status = status;
    _label = label;
    _quantatity = quantatity;
    _remainAmount = remainAmount;
    _extraCost = extraCost;
    _barginiaFee = barginiaFee;
    _damageDescription = damageDescription;
    _description = description;
    _weight = weight;
    _width = width;
    _height = height;
    _productInputs = productInputs;
}

  MyProductModel.fromJson(dynamic json) {
    _code = json['code'];
    _startDateDiscount = json['start_date_discount'];
    _lastDateDiscount = json['last_date_discount'];
    _priceDiscount = json['price_discount'];
    _totalDiscount = json['total_discount'];
    _name = json['name'];
    _slug = json['slug'];
    _modelSlug = json['model_slug'];
    _id = json['id'];
    _modelId = json['model_id'];
    _catname = json['catname'];
    _older = json['older'];
    _catId = json['cat_id'];
    _mainImg = json['main_img'];
    _price = json['price'];
    _total = json['total'];
    _priceAfterDiscount = json['price_after_discount'];
    _st = json['st'];
    _type = json['type'];
    _wayName = json['way_name'];
    _orderType = json['order_type'];
    _aramexLink = json['aramex_link'];
    _status = json['status'];
    _label = json['label'];
    _quantatity = json['quantatity'];
    _remainAmount = json['remain_amount'];
    _extraCost = json['extra_cost'];
    _barginiaFee = json['barginia_fee'];
    _damageDescription = json['damage_description'];
    _description = json['description'];
    _weight = json['weight'];
    _width = json['width'];
    _height = json['height'];
    if (json['product_inputs'] != null) {
      _productInputs = [];
      json['product_inputs'].forEach((v) {
        _productInputs?.add(ProductInputs.fromJson(v));
      });
    }
  }
  String? _code;
  String? _startDateDiscount;
  String? _lastDateDiscount;
  dynamic _priceDiscount;
  dynamic _totalDiscount;
  String? _name;
  String? _slug;
  String? _modelSlug;
  dynamic _id;
  dynamic _modelId;
  dynamic _catname;
  dynamic _older;
  dynamic _catId;
  String? _mainImg;
  String? _price;
  dynamic _total;
  dynamic _priceAfterDiscount;
  dynamic _st;
  dynamic _type;
  String? _wayName;
  String? _orderType;
  dynamic _aramexLink;
  dynamic _status;
  String? _label;
  dynamic _quantatity;
  dynamic _remainAmount;
  dynamic _extraCost;
  dynamic _barginiaFee;
  dynamic _damageDescription;
  dynamic _description;
  dynamic _weight;
  dynamic _width;
  dynamic _height;
  List<ProductInputs>? _productInputs;
MyProductModel copyWith({  String? code,
  String? startDateDiscount,
  String? lastDateDiscount,
  dynamic priceDiscount,
  dynamic totalDiscount,
  String? name,
  String? slug,
  String? modelSlug,
  dynamic id,
  dynamic modelId,
  dynamic catname,
  dynamic older,
  dynamic catId,
  String? mainImg,
  String? price,
  dynamic total,
  dynamic priceAfterDiscount,
  dynamic st,
  dynamic type,
  String? wayName,
  String? orderType,
  dynamic aramexLink,
  dynamic status,
  String? label,
  dynamic quantatity,
  dynamic remainAmount,
  dynamic extraCost,
  dynamic barginiaFee,
  dynamic damageDescription,
  dynamic description,
  dynamic weight,
  dynamic width,
  dynamic height,
  List<ProductInputs>? productInputs,
}) => MyProductModel(  code: code ?? _code,
  startDateDiscount: startDateDiscount ?? _startDateDiscount,
  lastDateDiscount: lastDateDiscount ?? _lastDateDiscount,
  priceDiscount: priceDiscount ?? _priceDiscount,
  totalDiscount: totalDiscount ?? _totalDiscount,
  name: name ?? _name,
  slug: slug ?? _slug,
  modelSlug: modelSlug ?? _modelSlug,
  id: id ?? _id,
  modelId: modelId ?? _modelId,
  catname: catname ?? _catname,
  older: older ?? _older,
  catId: catId ?? _catId,
  mainImg: mainImg ?? _mainImg,
  price: price ?? _price,
  total: total ?? _total,
  priceAfterDiscount: priceAfterDiscount ?? _priceAfterDiscount,
  st: st ?? _st,
  type: type ?? _type,
  wayName: wayName ?? _wayName,
  orderType: orderType ?? _orderType,
  aramexLink: aramexLink ?? _aramexLink,
  status: status ?? _status,
  label: label ?? _label,
  quantatity: quantatity ?? _quantatity,
  remainAmount: remainAmount ?? _remainAmount,
  extraCost: extraCost ?? _extraCost,
  barginiaFee: barginiaFee ?? _barginiaFee,
  damageDescription: damageDescription ?? _damageDescription,
  description: description ?? _description,
  weight: weight ?? _weight,
  width: width ?? _width,
  height: height ?? _height,
  productInputs: productInputs ?? _productInputs,
);
  String? get code => _code;
  String? get startDateDiscount => _startDateDiscount;
  String? get lastDateDiscount => _lastDateDiscount;
  dynamic get priceDiscount => _priceDiscount;
  dynamic get totalDiscount => _totalDiscount;
  String? get name => _name;
  String? get slug => _slug;
  String? get modelSlug => _modelSlug;
  dynamic get id => _id;
  dynamic get modelId => _modelId;
  dynamic get catname => _catname;
  dynamic get older => _older;
  dynamic get catId => _catId;
  String? get mainImg => _mainImg;
  String? get price => _price;
  dynamic get total => _total;
  dynamic get priceAfterDiscount => _priceAfterDiscount;
  dynamic get st => _st;
  dynamic get type => _type;
  String? get wayName => _wayName;
  String? get orderType => _orderType;
  dynamic get aramexLink => _aramexLink;
  dynamic get status => _status;
  String? get label => _label;
  dynamic get quantatity => _quantatity;
  dynamic get remainAmount => _remainAmount;
  dynamic get extraCost => _extraCost;
  dynamic get barginiaFee => _barginiaFee;
  dynamic get damageDescription => _damageDescription;
  dynamic get description => _description;
  dynamic get weight => _weight;
  dynamic get width => _width;
  dynamic get height => _height;
  List<ProductInputs>? get productInputs => _productInputs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['start_date_discount'] = _startDateDiscount;
    map['last_date_discount'] = _lastDateDiscount;
    map['price_discount'] = _priceDiscount;
    map['total_discount'] = _totalDiscount;
    map['name'] = _name;
    map['slug'] = _slug;
    map['model_slug'] = _modelSlug;
    map['id'] = _id;
    map['model_id'] = _modelId;
    map['catname'] = _catname;
    map['older'] = _older;
    map['cat_id'] = _catId;
    map['main_img'] = _mainImg;
    map['price'] = _price;
    map['total'] = _total;
    map['price_after_discount'] = _priceAfterDiscount;
    map['st'] = _st;
    map['type'] = _type;
    map['way_name'] = _wayName;
    map['order_type'] = _orderType;
    map['aramex_link'] = _aramexLink;
    map['status'] = _status;
    map['label'] = _label;
    map['quantatity'] = _quantatity;
    map['remain_amount'] = _remainAmount;
    map['extra_cost'] = _extraCost;
    map['barginia_fee'] = _barginiaFee;
    map['damage_description'] = _damageDescription;
    map['description'] = _description;
    map['weight'] = _weight;
    map['width'] = _width;
    map['height'] = _height;
    if (_productInputs != null) {
      map['product_inputs'] = _productInputs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 895
/// product_id : 374
/// input_id : 2
/// value : "26"
/// type : "Selectbox"
/// created_at : "2021-07-04 21:57:26"
/// updated_at : "2021-07-04 21:57:26"
/// deleted_at : null
/// name : "وحدة الذاكرة"

ProductInputs productInputsFromJson(String str) => ProductInputs.fromJson(json.decode(str));
String productInputsToJson(ProductInputs data) => json.encode(data.toJson());
class ProductInputs {
  ProductInputs({
      int? id, 
      int? productId, 
      int? inputId, 
      String? value, 
      String? type, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? name,}){
    _id = id;
    _productId = productId;
    _inputId = inputId;
    _value = value;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _name = name;
}

  ProductInputs.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _inputId = json['input_id'];
    _value = json['value'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _name = json['name'];
  }
  int? _id;
  int? _productId;
  int? _inputId;
  String? _value;
  String? _type;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _name;
ProductInputs copyWith({  int? id,
  int? productId,
  int? inputId,
  String? value,
  String? type,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  String? name,
}) => ProductInputs(  id: id ?? _id,
  productId: productId ?? _productId,
  inputId: inputId ?? _inputId,
  value: value ?? _value,
  type: type ?? _type,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  name: name ?? _name,
);
  int? get id => _id;
  int? get productId => _productId;
  int? get inputId => _inputId;
  String? get value => _value;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['input_id'] = _inputId;
    map['value'] = _value;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['name'] = _name;
    return map;
  }

}