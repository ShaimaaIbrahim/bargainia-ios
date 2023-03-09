import 'dart:developer';

import 'package:bargina/screens/auth/data/my_account_model.dart';
import 'package:bargina/screens/auth/model/login_model.dart';
import 'package:bargina/screens/main/BaseViewModel.dart';
import 'package:bargina/screens/main/account/model/order_model.dart';
import 'package:bargina/screens/main/account/model/transfer_model.dart';
import 'package:bargina/services/api_services.dart';
import 'package:bargina/services/firebase_services.dart';
import 'package:bargina/services/shared_prefrence_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../Locator.dart';
import '../../../../enums/ScreenState.dart';
import '../../../../models/Resources.dart';
import '../../../../models/Status.dart';
import '../../../../routes/RoutesNames.dart';
import '../../../../services/navigation_service.dart';
import '../../../../utils/common_functions.dart';
import '../model/my_product_model.dart';

class AccountViewModel extends BaseViewModel{


  final ApiService _apiService = ApiService();

  LoginModel? loginModel;
  MyAccountModel? myAccountModel;
  dynamic selectedCountry;
  dynamic selectedCity;
  dynamic selectedAddress;


  List<bool> checks =[];
  List<dynamic> cities =[];
  List<dynamic> countries =[];
  List<dynamic>? orders;
  List<dynamic>? products;
  List<dynamic>? addresses;

  TransferModel? transferModel;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  TextEditingController placeController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController postalController = TextEditingController();


  TextEditingController priceController = TextEditingController();
  TextEditingController countryFeeController = TextEditingController();
  TextEditingController priceFeeController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();

  DateTime currentDate = DateTime.now();
  String startDate = "";
  String endDate = "";


  void generateChecks() {
    for(int i =0 ; i< 100; i++){
      checks.add(false);
    }
  }

  void selectItem(int index){
    checks.fillRange(0, 100, false);
    checks[index] = !checks[index];
    notifyListeners();
  }

  // getUserAccount(){
  //   locator<SharedPreferencesServices>().getUserAuthInfo().then((value) {
  //      loginModel = val
  //      notifyListeners();
  //   });
  // }

  Future<void> getMyAccount(BuildContext context) async{
    //setState(ViewState.Busy);
    Resource<MyAccountModel> response = await _apiService.getMyAccount();
    switch (response.status) {
      case Status.SUCCESS:
        myAccountModel = response.data!;
          firstNameController.text = myAccountModel!.firstName!;
          lastNameController.text = myAccountModel!.lastName!;
          emailController.text = myAccountModel!.email!;
          phoneController.text= myAccountModel!.phone!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
       // setState(ViewState.Idle);
    //   showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  Future<void> getAllCities(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getAllCities();
    switch (response.status) {
      case Status.SUCCESS:
        cities = response.data!;
        selectedCity = cities[0];
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }
    setState(ViewState.Idle);
  }

  Future<void> getAllCountries(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getAllCountries();
    switch (response.status) {
      case Status.SUCCESS:
        countries = response.data!;
        selectedCountry = countries[0];
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }
    setState(ViewState.Idle);
  }

  void setSelectedCity(dynamic value){
    selectedCity = value;
    notifyListeners();
  }

  void setSelectedCountry(dynamic value){
    selectedCountry = value;
    notifyListeners();
  }

  void setInitCountryAndCity(countryId, cityId){

  }

  void addNewAddress(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<dynamic> response = await _apiService.addNewAddress(placeController.text, streetController.text,
        regionController.text, postalController.text, selectedCountry, selectedCity, check);
    switch (response.status) {
      case Status.SUCCESS:
        getMyAddresses(context);
        Navigator.of(context).pop();
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }
    setState(ViewState.Idle);
  }

  void updateAddress(BuildContext context, int id) async{
    setState(ViewState.Busy);
    Resource<dynamic> response = await _apiService.updateAddress(placeController.text, streetController.text,
        regionController.text, postalController.text, selectedCountry, selectedCity, check, id);
    switch (response.status) {
      case Status.SUCCESS:
        getMyAddresses(context);
        Navigator.of(context).pop();
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
       // setState(ViewState.Idle);
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  Future<void> getMyOrders(BuildContext context) async{
    setState(ViewState.Busy);
    if(await checkNetworkState()==true){
      Resource<List<dynamic>> response = await _apiService.getMyOrders();
      switch (response.status) {
        case Status.SUCCESS:
          orders = response.data!;
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          orders=[];
          setState(ViewState.Idle);
          showSnackBar(response.errorMessage!, context);
          break;
      }
    }else{
      setState(ViewState.NOINTERNET);
    }
  }

  Future<void> getMyProducts(BuildContext context) async{
    setState(ViewState.Busy);
    if(await checkNetworkState()==true){
      Resource<List<dynamic>> response = await _apiService.getMyProducts();
      switch (response.status) {
        case Status.SUCCESS:
          products = response.data!;
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
        // setState(ViewState.Idle);
          showSnackBar(response.errorMessage!, context);
          break;
      }
    }else{
      setState(ViewState.NOINTERNET);
    }
  }

  Future<void> getMyTransfers(BuildContext context) async{
    setState(ViewState.Busy);
    if(await checkNetworkState()==true){
      Resource<TransferModel> response = await _apiService.getMyTransfers();
      switch (response.status) {
        case Status.SUCCESS:
          transferModel = response.data!;
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          setState(ViewState.Idle);
          showSnackBar(response.errorMessage!, context);
          break;
      }
    }else{
     setState(ViewState.NOINTERNET);
    }
  }
  Future<void> getMyAddresses(BuildContext context) async{
    setState(ViewState.Busy);
    if(await checkNetworkState()==true){
      Resource<List<dynamic>> response = await _apiService.getMyAddresses();
      switch (response.status) {
        case Status.SUCCESS:
          addresses = response.data!;
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          setState(ViewState.Idle);
          showSnackBar(response.errorMessage!, context);
          break;
      }
    }else{
      setState(ViewState.NOINTERNET);
    }
  }

  Future<void> deleteAddress(BuildContext context, id) async{
    setState(ViewState.Busy);
    Resource<dynamic> response = await _apiService.deleteAddress(id);
    switch (response.status) {
      case Status.SUCCESS:
        getMyAddresses(context);
        showSnackBar(response.data, context);
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        setState(ViewState.Idle);
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  void setAddressAsDefault(BuildContext context , id) async{
    setState(ViewState.Busy);
    Resource<dynamic> response = await _apiService.setAddressAsDefault(id);
    switch (response.status) {
      case Status.SUCCESS:
        showSnackBar(response.data, context);
        getMyAddresses(context);
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        setState(ViewState.Idle);
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }


   logout(BuildContext context) async{
   // await loadingDialoge(context);
    locator<SharedPreferencesServices>().getUserAuthInfo().then((value) async{
      if(value.user!.provideName=='facebook'){
        locator<FirebaseServices>().logout(context);
      }
     else{
        Resource<String> response = await _apiService.logout();
        switch (response.status) {
          case Status.SUCCESS:
            locator<SharedPreferencesServices>().removeAuthInfo();
         //   locator<NavigationService>().navigateToAndClearStack(RouteName.SignIn);
            break;
          case Status.ERROR:
            showSnackBar(response.errorMessage!, context);
            break;
        }
     }
    });
  }

  bool isArabic = false;

  void initLanguage(BuildContext context){
    if(context.locale==Locale('ar', 'EG')){
      isArabic = true;
      context.setLocale(Locale('ar', 'EG'));
    }else{
      isArabic = false;
      context.setLocale(Locale('en', 'US'));
    }
  }

  void setEnglishLang(BuildContext context){
    if(context.locale!=Locale('en', 'US')){
      isArabic = false;
      context.setLocale(Locale('en', 'US'));
    }
  }

  void setArabicLang(BuildContext context){
    if(context.locale!=Locale('ar', 'EG')){
      isArabic = true;
      context.setLocale(Locale('ar', 'EG'));
    }
  }

  void selectAddress(address, i) {
    selectedAddress = address;
    notifyListeners();
  }

  void updatePassword(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<dynamic> response = await _apiService.updatePassword(oldPasswordController.text,
        newPassController.text, confirmPassController.text);
    switch (response.status) {
      case Status.SUCCESS:
        showSnackBar(response.data, context);
        locator<NavigationService>().goBack();
       // setState(ViewState.Idle);
        break;
      case Status.ERROR:
       // setState(ViewState.Idle);
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }


  deleteProduct(BuildContext context, id) async{
    setState(ViewState.Busy);
    Resource response = await _apiService.deleteProduct(id);
    switch (response.status) {
      case Status.SUCCESS:
        showSnackBar('product deleted successfully', context);
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  List<bool> visible = [false, false , false];

  void slideUp(index) {
     visible[index] = !visible[index];
     notifyListeners();
  }

  String dealwith = '';
  String returnPolicy ='';

  void getReturnPolicy(BuildContext context) async{
    setState(ViewState.Busy);
    Resource response = await _apiService.getReturnPolicy();
    switch (response.status) {
      case Status.SUCCESS:
        returnPolicy = response.data;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  void getDealWithBargina(BuildContext context) async{
    setState(ViewState.Busy);
    Resource response = await _apiService.getDealWithBargina();
    switch (response.status) {
      case Status.SUCCESS:
        dealwith = response.data;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  void updateProfile(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<dynamic> response = await _apiService.updateProfile(firstNameController.text,
        lastNameController.text, emailController.text, phoneController.text);
    switch (response.status) {
      case Status.SUCCESS:
        showSnackBar(response.data, context);
        locator<NavigationService>().goBack();
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }



  Future<void> selectDate(BuildContext context, int start) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate){
        currentDate = pickedDate;
        if(start == 1){
          startDate= '${currentDate.day} / ${currentDate.month} / ${currentDate.year}';
        }
        else {
          endDate = '${currentDate.day} / ${currentDate.month} / ${currentDate.year}';
        }
        setState(ViewState.Idle);
    }
  }

  void addDiscount(BuildContext context, productId) async{
    setState(ViewState.Busy);
    Resource<dynamic> response = await _apiService.addDiscount(productId,
        priceController.text, startDate, endDate, totalPriceController.text);

    switch (response.status) {
      case Status.SUCCESS:
        showSnackBar(response.data, context);
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  void setInitDate() {
    DateTime currentDate = DateTime.now();
    endDate = '${currentDate.day} / ${currentDate.month} / ${currentDate.year}';
    startDate = '${currentDate.day} / ${currentDate.month} / ${currentDate.year}';
    notifyListeners();
  }
}