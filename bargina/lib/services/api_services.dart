import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:developer';
import 'package:bargina/screens/main/model/review_model.dart';
import 'package:bargina/screens/main/model/sub_category_product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bargina/screens/auth/data/products/all_categories_model.dart';
import 'package:bargina/screens/auth/model/login_model.dart';
import 'package:bargina/screens/auth/model/register_model.dart';
import 'package:bargina/screens/auth/model/vendor_model.dart';
import 'package:bargina/screens/main/account/model/address_model.dart';
import 'package:bargina/screens/main/account/model/order_model.dart';
import 'package:bargina/screens/main/account/model/transfer_model.dart';
import 'package:bargina/screens/main/cart/model/shipping_model.dart';
import 'package:bargina/screens/main/model/about_us_model.dart';
import 'package:bargina/screens/main/model/condition_model.dart';
import 'package:bargina/screens/main/model/like4card_model.dart';
import 'package:bargina/screens/main/model/sell_categories_model.dart';
import 'package:bargina/services/shared_prefrence_services.dart';
import 'package:bargina/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:bargina/screens/auth/data/all_countries_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../Locator.dart';
import '../models/Resources.dart';
import '../models/Status.dart';
import '../screens/auth/data/cities_model.dart';
import '../screens/auth/data/my_account_model.dart';
import '../screens/auth/data/products/Product_details.dart';
import '../screens/auth/data/products/products_model.dart';
import '../screens/auth/model/Fee_model.dart';
import '../screens/auth/model/phone_code_verify_model.dart';
import '../screens/main/account/model/my_product_model.dart';
import '../screens/main/account/model/order_details_model.dart';
import '../screens/main/cart/model/checkoutid_model.dart';
import '../screens/main/cart/model/new_order_model.dart';
import '../screens/main/cart/model/payment_model.dart';
import '../screens/main/model/Durtation_model.dart';
import '../screens/main/model/carrior_model.dart';
import '../screens/main/model/category_input_model.dart';
import '../screens/main/model/like4card_cat_product.dart';
import '../screens/main/model/like4card_product_model.dart';
import '../screens/main/model/sell_sub_category_model.dart';
import '../screens/main/model/ship_price_model.dart';
import '../screens/main/model/terms_conditions_model.dart';
import '../screens/main/search/model/search_product_model.dart';

class ApiService {
  Dio _dio = Dio();

  //-=======================getAllCountries APIS HERE ========================
  Future<Resource<List<dynamic>>> getAllCountries() async {
    try {
      Response response = await _dio.get('$BASE_URL/countries');
      log('allCountries=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> countries = response.data
            .map((cat) => AllCountriesModel.fromJson(cat))
            .toList();
        return Resource(
          Status.SUCCESS,
          data: countries,
        );
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error!');
      }
    } catch (e) {
      log('allCountries=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }

  //-=======================LOGIN APIS HERE ========================
  Future<Resource<LoginModel>> login(String phone, String password) async {
    try {
      var data = {"phone": phone, "password": password};
      Response response = await _dio.post('$BASE_URL/login', data: data);
      log('login=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(
          Status.SUCCESS,
          data: LoginModel.fromJson(response.data),
        );
      } else {
        return Resource(Status.ERROR, errorMessage: 'Incorrect Login Data');
      }
    } catch (e) {
      log('login=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'Incorrect Login Data');
    }
  }

  //-=======================REGISTER APIS HERE ========================
  Future<Resource<RegisterModel>> register(
      String phone,
      String password,
      String passConfirm,
      String email,
      String lastname,
      String firstname) async {
    try {
      var data = {
        "phone": phone,
        "password": password,
        "password_confirmation": passConfirm,
        "email": email,
        "last_name": lastname,
        "first_name": firstname,
        "agree": "1"
      };
      Response response = await _dio.post('$BASE_URL/register', data: data);
      log('register=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(
          Status.SUCCESS,
          data: RegisterModel.fromJson(response.data),
        );
      } else {
        return Resource(Status.ERROR, errorMessage: response.data['error']);
      }
    } catch (e) {
      log('register=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'phone number or email is used befor');
    }
  }

  //-=======================PHONE CODE VERIFY APIS HERE ========================
  Future<Resource<PhoneCodeVerifyModel>> phoneCodeVerify(
      String phone, String code) async {
    try {
      var data = {"phone": phone, "code": code};
      Response response =
          await _dio.post('$BASE_URL/phone_code_verify', data: data);
      log('login=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(
          Status.SUCCESS,
          data: PhoneCodeVerifyModel.fromJson(response.data),
        );
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error!');
      }
    } catch (e) {
      log('login=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }

  //-=======================Get AllCategories APIS HERE ========================
  Future<Resource<List<dynamic>>> getAllCategories() async {
    try {
      Response response = await _dio.get('$BASE_URL/categories');
      if (response.statusCode == 200) {
        List<dynamic> categories = response.data
            .map((cat) => AllCategoriesModel.fromJson(cat))
            .toList();
        log('getAllCategories=============================${response.data}');

        return Resource(Status.SUCCESS, data: categories);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error!');
      }
    } catch (e) {
      log('getAllCategories=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }

  //-=======================getAllCities APIS HERE ========================
  Future<Resource<List<dynamic>>> getAllCities() async {
    try {
      Response response = await _dio.get('$BASE_URL/cities?country_id=75');
      log('getAllCities=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> cities =
            response.data.map((cat) => CitiesModel.fromJson(cat)).toList();
        return Resource(
          Status.SUCCESS,
          data: cities,
        );
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error!');
      }
    } catch (e) {
      log('getAllCities=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }

  //-=======================getProductsByCityId APIS HERE ========================
  Future<Resource<List<dynamic>>> getProductsByCityId(id) async {
    try {
      Response response;
      response = await _dio.get('$BASE_URL/products?city_id=$id');

      // if (id == null) {
      //   response = await _dio.get('$BASE_URL/products');
      // } else {
      //   response = await _dio.get('$BASE_URL/products?city_id=$id');
      // }
      log('getAllProductsByCityId $id=============================${response.data}');

      if (response.statusCode == 200) {
        List<dynamic> products =
            response.data.map((cat) => ProductsModel.fromJson(cat)).toList();
        //log('getAllProductsByCityId=============================${products[0].products[0].total}');
        return Resource(Status.SUCCESS, data: products);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error!');
      }
    } catch (e) {
      log('getAllProductsByCityId=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }

  //-=======================getProductsByCategoryId APIS HERE ========================
  Future<Resource<List<dynamic>>> getProductsByCategoryId(id) async {
    try {
      Response response = await _dio.get('$BASE_URL/products?cat_id=$id');

      log('getAllProductsByCategoryId=============================${response.data}');

      if (response.statusCode == 200) {
        List<dynamic> products =
            response.data.map((cat) => ProductsModel.fromJson(cat)).toList();
        //log('getAllProductsByCityId=============================${products[0].products[0].total}');
        return Resource(Status.SUCCESS, data: products);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error!');
      }
    } catch (e) {
      log('getAllProductsByCategoryId=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }

  //-=======================getProductsDetails APIS HERE ========================
  Future<Resource<ProductDetails>> getProductDetails(id) async {
    try {
      Response response = await _dio.get('$BASE_URL/products/$id');

      log('getAllProductsDetails=============================${response.data}');

      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS,
            data: ProductDetails.fromJson(response.data));
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error!');
      }
    } catch (e) {
      log('getAllProductsDetails=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }

  //-=======================getMyAccount APIS HERE ========================
  Future<Resource<MyAccountModel>> getMyAccount() async {
    try {
      Response response = await _dio.get('$BASE_URL/myaccount',
          options: Options(headers: await getHeaders(true)));
      log('getMyAccount=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS,
            data: MyAccountModel.fromJson(response.data));
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error!');
      }
    } catch (e) {
      log('getMyAccount=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }

  /**
   * ========================headers here-------------------
   */
  Future<Map<String, String>> getHeaders(bool isAuthenticated) async {
    final Map<String, String> headers = {};

    var data = await locator<SharedPreferencesServices>().getUserAuthInfo();
    print('shaimaa profiledispaly===================${data.token}');
    // headers.putIfAbsent(ACCEPT_LANGUAGE, () => 'ar');
    // headers.putIfAbsent('Content-Type', () => 'application/json');
    if (isAuthenticated == true) {
      headers['Authorization'] = 'Bearer ${data.token}';
    }

    return headers;
  }

  //-=======================SEARCH PRODUCT APIS HERE ========================
  Future<Resource<List<dynamic>>> searchProducts(String key) async {
    try {
      Response response = await _dio
          .get('$BASE_URL/products_search', queryParameters: {"search": key});
      log('searchProducts=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> products = response.data
            .map((cat) => SearchProductModel.fromJson(cat))
            .toList();
        return Resource(Status.SUCCESS, data: products);
      } else {
        return Resource(Status.ERROR, errorMessage: '');
      }
    } catch (e) {
      log('searchProducts=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: '');
    }
  }

  //-=======================GET MY ORDERS APIS HERE ========================
  Future<Resource<List<dynamic>>> getMyOrders() async {
    try {
      Response response = await _dio.get('$BASE_URL/my_orders',
          options: Options(headers: await getHeaders(true)));
      log('getMyOrders=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> orders =
            response.data.map((cat) => OrderModel.fromJson(cat)).toList();
        return Resource(Status.SUCCESS, data: orders);
      } else {
        return Resource(Status.ERROR, errorMessage: '');
      }
    } catch (e) {
      log('getMyOrders=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: '');
    }
  }

  //-=======================getMyProducts APIS HERE ========================
  Future<Resource<List<dynamic>>> getMyProducts() async {
    try {
      Response response = await _dio.get('$BASE_URL/my_products',
          options: Options(headers: await getHeaders(true)));
      log('getMyProducts=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> products =
            response.data.map((cat) => MyProductModel.fromJson(cat)).toList();
        return Resource(Status.SUCCESS, data: products);
      } else {
        return Resource(Status.ERROR, errorMessage: '');
      }
    } catch (e) {
      log('getMyProducts=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: '');
    }
  }

  //-=======================getMyTransfers APIS HERE ========================
  Future<Resource<TransferModel>> getMyTransfers() async {
    try {
      Response response = await _dio.get('$BASE_URL/transfers',
          options: Options(headers: await getHeaders(true)));
      log('getMyTransfers=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS,
            data: TransferModel.fromJson(response.data));
      } else {
        return Resource(Status.ERROR, errorMessage: '');
      }
    } catch (e) {
      log('getMyTransfers=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: '');
    }
  }

  ////////////////////Addresss  Apis ==========================
  //===================Api ADD NEW ADDRESS ===============================
  Future<Resource<dynamic>> addNewAddress(
      String place,
      String street,
      String region,
      String postalCode,
      selectedCountry,
      selectedCity,
      bool check) async {
    try {
      var data = {
        "address": place,
        "street": street,
        "state": region,
        "postal_code": postalCode,
        "city": selectedCity.id,
        "country": selectedCountry.id,
        "default": check == true ? 1 : 0
      };
      Response response = await _dio.post('$BASE_URL/add_address',
          data: data, options: Options(headers: await getHeaders(true)));
      log('AddNewAddress=============================${response.data}');
      if (response.statusCode == 204) {
        return Resource(Status.SUCCESS, data: 'address added successfully');
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error!');
      }
    } catch (e) {
      log('AddNewAddress=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }

  //===================Api UPDATE ADDRESS ===============================
  Future<Resource<dynamic>> updateAddress(
      String place,
      String street,
      String region,
      String postalCode,
      selectedCountry,
      selectedCity,
      bool check,
      int id) async {
    try {
      var data = {
        "address": place,
        "street": street,
        "state": region,
        "postal_code": postalCode,
        "city": selectedCity.id,
        "country": selectedCountry.id,
        "default": check == true ? 1 : 0,
        "id": id
      };
      Response response = await _dio.post('$BASE_URL/update_address',
          data: data, options: Options(headers: await getHeaders(true)));
      log('updateAddress=============================${response.data}');
      if (response.statusCode == 200 || response.statusCode == 204) {
        return Resource(Status.SUCCESS, data: 'address updated successfully');
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error!');
      }
    } catch (e) {
      log('updateAddress=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }

  //-=======================getMyTransfers APIS HERE ========================
  Future<Resource<List<dynamic>>> getMyAddresses() async {
    try {
      Response response = await _dio.get('$BASE_URL/shipping_address',
          options: Options(headers: await getHeaders(true)));
      log('getMyAddresses=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> addresses =
            response.data.map((cat) => AddressModel.fromJson(cat)).toList();
        return Resource(Status.SUCCESS, data: addresses);
      } else {
        return Resource(Status.ERROR, errorMessage: '');
      }
    } catch (e) {
      log('getMyAddresses=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: '');
    }
  }

  Future<Resource<TermsConditionsModel>> getTerms() async {
    try {
      Response response = await _dio.get('$BASE_URL/terms_and_conditions');
      log('getTerms=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS,
            data: TermsConditionsModel.fromJson(response.data));
      } else {
        return Resource(Status.ERROR, errorMessage: '');
      }
    } catch (e) {
      log('getTerms=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: '');
    }
  }

  Future<Resource<AboutUsModel>> aboutUs() async {
    try {
      Response response = await _dio.get('$BASE_URL/about_us');
      log('aboutUs=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS,
            data: AboutUsModel.fromJson(response.data));
      } else {
        return Resource(Status.ERROR, errorMessage: '');
      }
    } catch (e) {
      log('aboutUs=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: '');
    }
  }

  Future<Resource<VendorModel>> vendorRegister(
      String phone,
      String lastName,
      String firstName,
      String bankNo,
      String commircalNo,
      String vatNum,
      vatNumberImage,
      commircalNumberImage) async {
    try {
      FormData formData = FormData.fromMap({
        "vat_registration_image": await MultipartFile.fromFile(
            vatNumberImage.path,
            filename: vatNumberImage.path.split('/').last),
        "commercial_registration_image": await MultipartFile.fromFile(
            commircalNumberImage.path,
            filename: commircalNumberImage.path.split('/').last),
        "display_name": firstName,
        "legal_name": lastName,
        "commercial_registration_no": commircalNo,
        "vat_registration_no": vatNum,
        "bank_iban_no": bankNo,
        "phone": phone,
      });
      Response response = await _dio.post('$BASE_URL/vendor_register',
          data: formData, options: Options(headers: await getHeaders(true)));
      log('vendor register=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(
          Status.SUCCESS,
          data: VendorModel.fromJson(response.data),
        );
      } else {
        return Resource(Status.ERROR, errorMessage: 'some fields are required');
      }
    } catch (e) {
      log('vendor register catch =============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'some fields are used befor');
    }
  }

  Future<Resource<List<dynamic>>> filterProducts(id, String selectedDate, String selectedPrice) async {
    try {
      Response response = await _dio.get('$BASE_URL/products_filter',
          queryParameters: {
            "price": selectedPrice,
            "date": selectedDate,
            "id": id
          });
      log('filterProducts=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> products = response.data.map((cat) => ProductsModel.fromJson(cat)).toList();
        return Resource(Status.SUCCESS, data: products);
      } else {
        return Resource(Status.ERROR, errorMessage: '');
      }
    } catch (e) {
      log('filterProducts=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: '');
    }
  }

  Future<Resource<dynamic>> deleteAddress(id) async {
    try {
      Response response = await _dio.post('$BASE_URL/delete_address',
          data: {"id": id}, options: Options(headers: await getHeaders(true)));
      log('deleteAddress=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS, data: response.data['msg']);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('deleteAddress=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  //GET SELL CATEGORIES
  Future<Resource<List<dynamic>>> getSellCategories() async {
    try {
      Response response = await _dio.get('$BASE_URL/sell_categories',
          options: Options(headers: await getHeaders(true)));
      log('getSellCategories=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> products = response.data
            .map((product) => SellCategoriesModel.fromJson(product))
            .toList();
        return Resource(Status.SUCCESS, data: products);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('getSellCategories=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  //GET SELL SUB CATEGORIES
  Future<Resource<List<dynamic>>> getSellSubCategories(id) async {
    try {
      Response response = await _dio.get('$BASE_URL/sell_sub_categories/$id',
          options: Options(headers: await getHeaders(true)));
      log('getSellSubCategories=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> products = response.data
            .map((product) => SellSubCategoryModel.fromJson(product))
            .toList();
        return Resource(Status.SUCCESS, data: products);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('getSellSubCategories=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  //GET SELL INPUTS CATEGORIES
  Future<Resource<List<dynamic>>> getCategoryInputs(id) async {
    try {
      Response response = await _dio.get('$BASE_URL/get_inputs/$id',
          options: Options(headers: await getHeaders(true)));
      log('getCategoryInputs=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> inputs = response.data
            .map((product) => CategoryInputModel.fromJson(product))
            .toList();
        return Resource(Status.SUCCESS, data: inputs);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('getCategoryInputs=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  //GET ALL SHIPPING CARRIORS
  Future<Resource<List<dynamic>>> getShippingCarriors() async {
    try {
      Response response = await _dio.get('$BASE_URL/sell_carriers',
          options: Options(headers: await getHeaders(true)));
      log('getShippingCarriors=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> inputs = response.data
            .map((product) => CarriorModel.fromJson(product))
            .toList();
        return Resource(Status.SUCCESS, data: inputs);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('getShippingCarriors=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<List<dynamic>>> getSellCategoriesProducts(id) async {
    try {
      Response response = await _dio.get('$BASE_URL/subcategory_products/$id',
          options: Options(headers: await getHeaders(true)));
      log('getSellCategoriesProducts=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> inputs = response.data.map((product) => SubCategoryProductModel.fromJson(product)).toList();
        return Resource(Status.SUCCESS, data: inputs);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('getSellCategoriesProducts=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<List<dynamic>>> getSellConditions() async {
    try {
      Response response = await _dio.get('$BASE_URL/sell_conditions',
          options: Options(headers: await getHeaders(true)));
      log('getSellConditions=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> inputs =
            response.data.map((cond) => ConditionModel.fromJson(cond)).toList();

        return Resource(Status.SUCCESS, data: inputs);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('getSellConditions=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }


  Future<Resource<List<dynamic>>> getDurations() async {
    try {
      Response response = await _dio.get('$BASE_URL/duration',
          options: Options(headers: await getHeaders(true)));
      log('getDutations=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> inputs =
        response.data.map((cond) => DurtationModel.fromJson(cond)).toList();

        return Resource(Status.SUCCESS, data: inputs);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('getDutations=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<List<dynamic>>> getPaymentsMethods() async {
    try {
      Response response = await _dio.get('$BASE_URL/payment_methods',
          options: Options(headers: await getHeaders(true)));
      log('getPaymentsMethods=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> inputs =
            response.data.map((cond) => PaymentModel.fromJson(cond)).toList();
        return Resource(Status.SUCCESS, data: inputs);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('getPaymentsMethods=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<List<dynamic>>> getShippingMethods() async {
    try {
      Response response = await _dio.get('$BASE_URL/shipping_methods',
          options: Options(headers: await getHeaders(true)));
      log('getSellCategoriesProducts=============================${response.data}');
      if (response.statusCode == 200) {
        List<dynamic> inputs =
            response.data.map((cond) => ShippingModel.fromJson(cond)).toList();
        return Resource(Status.SUCCESS, data: inputs);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('getSellCategoriesProducts=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  //CREATE CHECOUT ID---------------------
  Future<Resource<dynamic>> createCheckoutId(amount) async {
    try {
      Response response = await _dio.post('$BASE_URL/create_checkout_id',
          options: Options(headers: await getHeaders(true)),
          data: {"amount": amount, "payment_method": "VISA"});

      log('createCheckoutId===========================${response.data}');

      //  log('createCheckoutId=============================${CheckoutidModel.fromJson(json.decode(response.data)).id}');
      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS,
            data: CheckoutidModel.fromJson(json.decode(response.data)).id);
      } else {
        return Resource(Status.ERROR,
            errorMessage:
                '${response.statusCode} -- ${response.statusMessage}');
      }
    } catch (e) {
      log('createCheckoutId=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<String> getpaymentstatus(checkoutid) async {
    String myUrl = "$BASE_URL/get_payment_status/$checkoutid";
    final response = await Dio().post(myUrl,
        data: {"payment_method": "VISA"},
        options: Options(headers: await getHeaders(true)));
    print("payment_status: ${response.data}");
    return response.data['result']['description'];
  }

  //-=======================setAddressAsDefault ========================
  Future<Resource<String>> setAddressAsDefault(id) async {
    try {
      Response response = await _dio.get('$BASE_URL/set_default/$id',
          options: Options(headers: await getHeaders(true)));
      log('setAddressAsDefault=============================${response.data}');

      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS, data: 'success');
      } else {
        return Resource(Status.ERROR, errorMessage: 'failed');
      }
    } catch (e) {
      log('setAddressAsDefault=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: '');
    }
  }

//FORGET PASSOWORD APIS
  Future<Resource<String>> passwordEmail(email) async {
    try {
      var data = {"email": email};

      Response response =
          await _dio.post('$BASE_URL/password_email', data: data);

      log('passwordEmail=============================${response.data}');

      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS,
            data: response.data['token'].toString());
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('passwordEmail=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<String>> passwordEmailToken(email, token) async {
    try {
      var data = {"email": email, "token": token};

      Response response =
          await _dio.post('$BASE_URL/password_email_token', data: data);

      log('passwordEmailToken=============================${response.data}');

      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS,
            data: response.data['token'].toString());
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('passwordEmailToken=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<dynamic>> passwordReset(
      token, newPassword, oldPassword) async {
    try {
      var data = {
        "token": token,
        "new_password": newPassword,
        "confirm_password": oldPassword
      };

      Response response =
          await _dio.post('$BASE_URL/password_reset', data: data);

      log('passwordReset=============================${response.data}');

      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS, data: 'success');
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('passwordReset=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

//////////////////////LIKE FOR CARDS APIS /////////////////////////////////

  Future<Resource<List<dynamic>>> getLike4CardCategories() async {
    try {
      Response response = await _dio.get('$BASE_URL/like4card_categories');

      log('getLike4CardCategories=============================${response.data}');

      if (response.statusCode == 200) {
        List<dynamic> inputs =
            response.data.map((cond) => Like4cardModel.fromJson(cond)).toList();
        return Resource(Status.SUCCESS, data: inputs);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('getLike4CardCategories=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<List<dynamic>>> getLike4CardPrdouctsByCategory(id) async {
    try {
      Response response = await _dio.get('$BASE_URL/like4card_products/$id');

      log('getLike4CardPrdouctsByCategory=============================${response.data}');

      if (response.statusCode == 200) {
        List<dynamic> inputs = response.data.map((cond) => Like4cardCatProduct.fromJson(cond)).toList();

        return Resource(Status.SUCCESS, data: inputs);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('getLike4CardPrdouctsByCategory=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<String>> updateProducts(
      height,
      weight,
      width,
      condition_id,
      price,
      carrier_id,
      description,
      quantity,
      Map<String, String> options, id) async {
    try {
      var formData = {
        'options': options,
        "id": id,
        "country_id": "75",
        "city_id": "76",
        "price": price,
        "quantity": quantity,
        "condition": condition_id,
        "damage_desc": "test",
        "zip_code": "87878787",
        "location": "545754",
        "express_shipping": "1",
        "headline": "test",
        "description": description,
        "carrier_id": carrier_id,
        "shown_duration": "22",
        "modelid": "45",
        "width": width,
        "height": height,
        "weight": weight,
      };

      Response response = await _dio.post('$BASE_URL/updateproduct',
          options: Options(
            headers: await getHeaders(true),
          ),
          data: formData);

      var dataRes = response.data;
      log('updateProducts=============================${response.data}');
      if (response.statusCode == 200 && dataRes['status'] != false) {
        return Resource(Status.SUCCESS, data: response.data['code']);
      } else {
        return Resource(Status.ERROR, errorMessage: dataRes['msg']);
      }
    } catch (e) {
      log('updateProducts=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<String>> saveProducts(
      catId,
      height,
      weight,
      width,
      condition_id,
      price,
      carrier_id,
      description,
      quantity,
      Map<String, String> options,
      List<XFile> imagesList,
      duration,
      headline) async {
    try {
      List<MultipartFile> multipartfiles = [];
      imagesList.forEach((element) async {
        multipartfiles.add(
            await MultipartFile.fromFile(element.path, filename: element.name));
      });

      FormData formData = FormData.fromMap({
        'options': options,
        "country_id": "75",
        "city_id": "76",
        //"catid": catId,
        "price": price,
        "quantity": quantity,
        "condition": condition_id,
        "damage_desc": "test",
        "zip_code": "87878787",
        "location": "545754",
        "express_shipping": "1",
        "headline": headline,
        "description": description,
        "carrier_id": carrier_id,
        "shown_duration": duration,
        "modelid": catId,
        "width": width,
        "height": height,
        "weight": weight,
        'main_img': await MultipartFile.fromFile(imagesList[0].path,
            filename: imagesList[0].name),
        'files': multipartfiles
      });

      Response response = await _dio.post('$BASE_URL/saveproduct',
          options: Options(
            headers: await getHeaders(true),
          ),
          data: formData);

      var dataRes = response.data;
      log('saveProducts=============================${response.data}');
      if (response.statusCode == 200 && dataRes['status'] != false) {
        return Resource(Status.SUCCESS, data: response.data['code']);
      } else {
        return Resource(Status.ERROR, errorMessage: dataRes['msg']);
      }
    } catch (e) {
      log('saveProducts=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  //CALCULATE SHIPPING PRICE============================
  Future<Resource<ShipPriceModel>> calculateShippingPrice(product_id, quantity,
      discount_code, way_cost, address_id, ship_way) async {
    try {
      var data = {
        'product_id': product_id,
        'quantity': quantity,
        //'discount_code': discount_code,
        'way_cost': way_cost,
        'address_id': address_id,
        'ship_way': ship_way
      };
      Response response = await _dio.post('$BASE_URL/ship_price',
          data: data, options: Options(headers: await getHeaders(true)));
      log('calculateShippingPrice=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS,
            data: ShipPriceModel.fromJson(response.data));
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('calculateShippingPrice=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  //NEW ORDER CHECKOUT========================
  Future<Resource<NewOrderModel>> neworder(product_id, quantity, discount_code,
      way_cost, address_id, ship_way) async {
    try {
      var data = {
        'product_id': product_id,
        'quantity': quantity,
        'discount_code': discount_code,
        'way_cost': way_cost,
        'address_id': address_id,
        'ship_way': ship_way
      };
      Response response = await _dio.post('$BASE_URL/neworder',
          data: data, options: Options(headers: await getHeaders(true)));
      log('neworder=============================${response.data}');
      if (response.statusCode == 200 && response.data['status']) {
        return Resource(Status.SUCCESS,
            data: NewOrderModel.fromJson(response.data));
      } else {
        return Resource(Status.ERROR, errorMessage: response.data['message']);
      }
    } catch (e) {
      log('neworder=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<dynamic>> getOrderDetails(id) async {
    try {
      Response  response = await _dio.get('$BASE_URL/order_detail/$id',
          options: Options(headers: await getHeaders(true)));

      log('getOrderDetails=============================${response.data}');

      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS, data: response.data);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('getOrderDetails=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage : 'eroror ');
    }
  }

  Future<Resource<String>> logout() async {
    try {
      Response response = await _dio.post('$BASE_URL/logout',
          options: Options(headers: await getHeaders(true)));

      log('logout=============================${response.data}');

      if (response.statusCode == 200 || response.statusCode == 204) {
        return Resource(Status.SUCCESS, data: 'success');
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('logout=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<LoginModel>> socialRegister(
      email, name, profileId, provideName) async {
    try {
      var data = {
        "email": email,
        "first_name": name,
        "profile_id": profileId,
        "provide_name": provideName
      };
      Response response =
          await _dio.post('$BASE_URL/social_registeration', data: data);

      var dataRes = response.data;

      log('socialRegister=============================${response.data}');
      if (response.statusCode == 200 && dataRes['status'] != false) {
        return Resource(Status.SUCCESS,
            data: LoginModel.fromJson(response.data));
      } else {
        return Resource(Status.ERROR, errorMessage: dataRes['msg']);
      }
    } catch (e) {
      log('socialRegister=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }


  /**
   * sovcail login--
   */
  Future<Resource<LoginModel>> socialLogin(email) async {
    try {
      var data = {
        "email": email,
      };
      Response response =
      await _dio.post('$BASE_URL/social_login', data: data);

      var dataRes = response.data;

      log('socialLogin=============================${dataRes}');
      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS,
            data: LoginModel.fromJson(response.data));
      } else {
        return Resource(Status.ERROR, errorMessage: dataRes['msg']);
      }
    } catch (e) {
      log('socialLogin=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<dynamic>> updatePassword(String oldPss, String newPss, String confirmPss) async {
    try {
      var data = {
        "old_password": oldPss,
        "password": newPss,
        "confirm_password": confirmPss
      };
      Response response = await _dio.post('$BASE_URL/update_password', options: Options(headers: await getHeaders(true)), data: data);

      log('updatePassword=============================${response.data}');

      var dataRes = response.data;

      if (response.statusCode == 200 && dataRes['status'] != false) {
        return Resource(Status.SUCCESS, data: 'password updated successfully');
      } else {
        return Resource(Status.ERROR, errorMessage: dataRes['msg']);
      }
    } catch (e) {
      log('updatePassword=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  Future<Resource<dynamic>> verifyCode(String phone, code) async {
    try {
      var data = {"phone": phone, "code": code};
      Response response =
          await _dio.post('$BASE_URL/phone_code_verify', data: data);

      log('verifyCode=============================${response.data}');

      if (response.statusCode == 200 || response.statusCode == 204) {
        return Resource(Status.SUCCESS, data: 'success');
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('verifyCode=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }


  Future<Resource<dynamic>> deleteProduct(id) async{
    try {
      Response response = await _dio.get('$BASE_URL/delete_product/$id', options: Options(headers: await getHeaders(true)));

      log('deleteProduct=============================${response.data}');

      if (response.statusCode == 200 || response.statusCode == 204) {
        return Resource(Status.SUCCESS, data: 'success');
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('deleteProduct=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  //add review api
  Future<Resource<dynamic>> addReview(id, name, review, rate) async{
    try {
      var data = {
        "product_id": id,
        "name": name,
        "review": review,
        "rate": rate
      };
      Response response = await _dio.post('$BASE_URL/add_review',
          options: Options(headers: await getHeaders(true)), data: data);

      log('addReview=============================${response.data}');

      if (response.statusCode == 200 || response.statusCode == 204) {
        return Resource(Status.SUCCESS, data: 'success');
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('addReview=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }


  //show product reviews ---
  Future<Resource<List<dynamic>>> showProductReviews(id) async{
    try {
      Response response = await _dio.get('$BASE_URL/product_reviews/$id');

      log('showProductReviews=============================${response.data}');

      if (response.statusCode == 200 || response.statusCode == 204) {
        List<dynamic> inputs = response.data.map((cond) => ReviewModel.fromJson(cond)).toList();

        return Resource(Status.SUCCESS, data: inputs);
      } else {
        return Resource(Status.ERROR, errorMessage: 'unexpected error');
      }
    } catch (e) {
      log('showProductReviews=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

 Future<Resource<dynamic>> getReturnPolicy() async{
    try {
      Response response = await _dio.get('$BASE_URL/return_policy');
      log('getReturnPolicy=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS, data: response.data['content']);
      } else {
        return Resource(Status.ERROR, errorMessage: '');
      }
    } catch (e) {
      log('getReturnPolicy=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: '');
    }
  }

  Future<Resource<dynamic>> getDealWithBargina() async{
    try {
      Response response = await _dio.get('$BASE_URL/deal_with_bargina');
      log('getDealWithBargina=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS, data: response.data['content']);
      } else {
        return Resource(Status.ERROR, errorMessage: '');
      }
    } catch (e) {
      log('getDealWithBargina=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: '');
    }
  }

  Future<Resource<FeeModel>> getFees() async{
    try {
      Response response = await _dio.get('$BASE_URL/fees', options: Options(headers: await getHeaders(true)));
      log('getFees=============================${response.data}');
      if (response.statusCode == 200) {
        return Resource(Status.SUCCESS, data: FeeModel.fromJson(response.data));
      } else {
        return Resource(Status.ERROR, errorMessage: '0');
      }
    } catch (e) {
      log('getFees=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: '0');
    }
  }

  Future<Resource<dynamic>> updateProfile(String firstname, String lastname, String email, String phone) async {
    try {
      var data = {
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
        "phone": phone
      };
      Response response = await _dio.post('$BASE_URL/update_profile', options: Options(headers: await getHeaders(true)), data: data);

    log('updatePassword=============================${response.data}');

    var dataRes = response.data;

    if (response.statusCode == 200 && dataRes['status'] != false) {
    return Resource(Status.SUCCESS, data: 'profile updated successfully');
    } else {
    return Resource(Status.ERROR, errorMessage: 'error occured when update');
    }
    } catch (e) {
    log('updatePassword=============================${e.toString()}');
    return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }

  //add review api
  Future<Resource<dynamic>> addDiscount(productId, price, startDate, maxDate, total) async{
    try {
      var data = {
        "product_id": productId,
        "price": price,
        "start_date": startDate,
        "maximun_date": maxDate,
        "total": total
      };
      Response response = await _dio.post('$BASE_URL/add_discount',
          options: Options(headers: await getHeaders(true)), data: data);

      log('add_discount=============================${response.data}');

      if (response.statusCode == 200 || response.statusCode == 204) {
        return Resource(Status.SUCCESS, data: response.data['msg']);
      } else {
        return Resource(Status.ERROR, errorMessage: response.data['msg']);
      }
    } catch (e) {
      log('add_discount=============================${e.toString()}');
      return Resource(Status.ERROR, errorMessage: 'unexpected error');
    }
  }
}
