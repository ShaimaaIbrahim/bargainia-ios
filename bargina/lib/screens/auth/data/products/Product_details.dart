import 'Images.dart';

class ProductDetails {
  ProductDetails({
      this.id, 
      this.code, 
      this.title, 
      this.description, 
      this.price, 
      this.priceDiscount, 
      this.total, 
      this.image, 
      this.countRate, 
      this.isFavourite, 
      this.quantatity, 
      this.activeAt, 
      this.expireAt, 
      this.viewCount, 
      this.remainAmount, 
      this.images, 
      this.weight, 
      this.width, 
      this.totalDiscount, 
      this.startDateDiscount, 
      this.lastDateDiscount, 
      this.taxes, 
      this.sizes, 
      this.shownDuration, 
      this.shipAddress, 
      this.expressShipping, 
      this.license, 
      this.rates,});

  ProductDetails.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    priceDiscount = json['price_discount'];
    total = json['total'];
    image = json['image'];
    countRate = json['count_rate'];
    isFavourite = json['is_favourite'];
    quantatity = json['quantatity'];
    activeAt = json['active_at'];
    expireAt = json['expire_at'];
    viewCount = json['view_count'];
    remainAmount = json['remain_amount'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    weight = json['weight'];
    width = json['width'];
    totalDiscount = json['total_discount'];
    startDateDiscount = json['start_date_discount'];
    lastDateDiscount = json['last_date_discount'];
    taxes = json['taxes'];
    if (json['sizes'] != null) {
      sizes = [];
      json['sizes'].forEach((v) {
        //sizes.add(Dynamic.fromJson(v));
      });
    }
    shownDuration = json['shown_duration'];
    shipAddress = json['ship_address'];
    expressShipping = json['express_shipping'];
    license = json['license'];
    if (json['rates'] != null) {
      rates = [];
      json['rates'].forEach((v) {
        //rates!.add(Dynamic.fromJson(v));
      });
    }
  }
  int? id;
  String? code;
  String? title;
  String? description;
  dynamic price;
  int? priceDiscount;
  dynamic total;
  String? image;
  dynamic countRate;
  int? isFavourite;
  int? quantatity;
  String? activeAt;
  String? expireAt;
  int? viewCount;
  int? remainAmount;
  List<Images>? images;
  dynamic weight;
  int? width;
  int? totalDiscount;
  dynamic startDateDiscount;
  dynamic lastDateDiscount;
  String? taxes;
  List<dynamic>? sizes;
  String? shownDuration;
  dynamic shipAddress;
  int? expressShipping;
  dynamic license;
  List<dynamic>? rates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['title'] = title;
    map['description'] = description;
    map['price'] = price;
    map['price_discount'] = priceDiscount;
    map['total'] = total;
    map['image'] = image;
    map['count_rate'] = countRate;
    map['is_favourite'] = isFavourite;
    map['quantatity'] = quantatity;
    map['active_at'] = activeAt;
    map['expire_at'] = expireAt;
    map['view_count'] = viewCount;
    map['remain_amount'] = remainAmount;
    if (images != null) {
      map['images'] = images!.map((v) => v.toJson()).toList();
    }
    map['weight'] = weight;
    map['width'] = width;
    map['total_discount'] = totalDiscount;
    map['start_date_discount'] = startDateDiscount;
    map['last_date_discount'] = lastDateDiscount;
    map['taxes'] = taxes;
    if (sizes != null) {
      map['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    map['shown_duration'] = shownDuration;
    map['ship_address'] = shipAddress;
    map['express_shipping'] = expressShipping;
    map['license'] = license;
    if (rates != null) {
      map['rates'] = rates!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}